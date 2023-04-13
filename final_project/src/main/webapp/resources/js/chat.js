let ws;
let memberId;

    $(function(){
        memberId = $('[name=chatMemberId]').val();
        if(memberId != undefined){
            console.log("not undefined");
            ws = new WebSocket("ws://192.168.10.4/startChat.do");
            ws.onopen = startChat;
            ws.onmessage = receiveMsg;
            ws.onclose = endChat;
        }else{
            console.log("undefined");
        }
    });

    $('.logout').on('click',function(){
        endChat();
        location.href = "/logout.do";
    })
    
    function startChat(){
        console.log("memberId : "+memberId);
        const data = {type:"login",memberId:memberId}
        ws.send(JSON.stringify(data));
    }

    function receiveMsg(param){
        const data = JSON.parse(param.data);
        console.log(data);
        console.log(data.senderId);
        if(data.type == "sendCondition" && data.msg == "sendOk" ){
            chatList(data.senderId);
            const divValue = $('.active_chat_title');
            for(let i=0;i<divValue.length;i++){
                const val = divValue.eq(i).attr('value');
                console.log(val);
                console.log(data.senderId);
                if(val == data.senderId){
                    console.log("adminChatList실행 index: "+i);
                    adminChatList(data.senderId,i);
                }
            }
        }
    }
    function endChat(){
        const data = {type:"logout",memberId:memberId}
        ws.send(JSON.stringify(data));
    }

    function startChatBtn(myPageMemberId){
        const jsMemberId = myPageMemberId;
        $.ajax({
            url : "/chat.do",
            type : "POST",
            data : {memberId:jsMemberId},
            success : function(result){
                console.log(result);
                if(result !="caOk"){
                    alert("관리자에게 문의하세요");
                }else{
                    chatList(jsMemberId);
                    $('[name=startChatBtn]').hide();
                    $('.chatting').slideDown();

                }
            }
        })
    }

    function chatList(myPageMemberId){
        const jsMemberId = myPageMemberId;
        $.ajax({
            url : "/chatList.do",
            type : "POST",
            data : {memberId:jsMemberId},
            success : function(list){
                $('.messageArea').empty();
                for(let i=0; i<list.length;i++){
                    const msg = list[i];
                    console.log(msg);
                    if(msg.senderCheck == 2){
                        const chatContent = msg.chatContent;
                        const idDiv = $("<div class='chatLeft'>");
                        idDiv.text("admin");
                        const contentDiv = $('<div class="chat_left">');
                        contentDiv.text(chatContent);
                        $('.messageArea').append(idDiv).append(contentDiv);
                    }else if(msg.senderCheck == 1){
                        const chatContent = list[i].chatContent;
                        const chatDate = list[i].chatDate;
                        const contentDiv = $('<div class="chat_right">');
                        contentDiv.text(chatContent);
                        $('.messageArea').append(contentDiv);
                        console.log("senderCheck : "+msg.senderCheck);
                    }
                }
                $('.messageArea').scrollTop($('.messageArea')[0].scrollHeight);
            }
        })
    
    }


    function sendMsg(){
        const msg = $('#sendMsg').val();
        if(msg != ""){
            const data = {type:"send",msg:msg,sender:memberId};
            ws.send(JSON.stringify(data));
        }
        $('#sendMsg').val('');
    } ;  
    

   