let ws;
let memberId;


    window.onload = function(){

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
    }
    

    $('.logout').on('click',function(){
        endChat();
        location.href = "/logout.do";
    })
    
    function startChat(){
        console.log("memberId1111111 : "+memberId);
        const hiddenMemberGrade = $('input[type=hidden].hiddenMemberGrade');
        console.log("grade : "+hiddenMemberGrade.val());
        if(hiddenMemberGrade.val() == 1){
            const data = {type:"login",memberId:"admin"}; 
            ws.send(JSON.stringify(data));
        }else if(hiddenMemberGrade.val() != 1){
            const data = {type:"login",memberId:memberId};
            ws.send(JSON.stringify(data));
        }
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
        }else if(data.type == "endChat"){
            const input = $('input[type=hidden].memberId');
            console.log(input);
            for(let i=0 ;i<input.length;i++){
                if(input.eq(i).val()== data.memberId){
                    console.log("input :"+input);
                    input.eq(i).next().next().next().next().text('채팅종료');
                    input.eq(i).next().next().next().next().css('color','black');
                    // const li = input.eq(i).parent().parent();
                    // console.log("li : "+li);
                    // console.log(li);
                    // const chatDiv = input.eq(i).parent().parent().next();
                    // console.log("chatDiv : "+chatDiv);
                    // console.log(chatDiv);
                    // $('.hiddenDiv').after(chatDiv);
                    // $('.hiddenDiv').after(li);
                }
            }
        }else if(data.type == "startChat"){
            const input = $('input[type=hidden].memberId');
            console.log(input);
            for(let i=0 ;i<input.length;i++){
                if(input.eq(i).val()== data.memberId){
                    console.log("input :"+input);
                    input.eq(i).next().next().next().next().text('채팅중');
                    input.eq(i).next().next().next().next().css('color','#19A7CE');
                    // const li = input.eq(i).parent().parent();
                    // console.log("li : "+li);
                    // console.log(li);
                    // const chatDiv = input.eq(i).parent().parent().next();
                    // console.log("chatDiv : "+chatDiv);
                    // console.log(chatDiv);
                    // $('.activeDiv').after(chatDiv);
                    // $('.activeDiv').after(li);
                    
                }
            }
        }
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
                        const chatDate = msg.chatDate;
                        console.log("chatDate : "+chatDate);
                        const dateDiv = $("<div class='dateDiv'>");
                        dateDiv.text(chatDate);
                        console.log("chatDateDiv : "+dateDiv);                       
                        const idDiv = $("<div class='chatLeft'>");
                        idDiv.text("admin");
                        const contentDiv = $('<div class="chat_left">');
                        contentDiv.text(chatContent);
                        const containerDiv = $('<div class="containerDiv">');
                        containerDiv.append(contentDiv).append(dateDiv);
                        $('.messageArea').append(idDiv).append(containerDiv);
                        $('.chatChkSpan').text('[1]');
                    }else if(msg.senderCheck == 1){
                        const chatContent = list[i].chatContent;
                        const chatDate = list[i].chatDate;
                        const contentDiv = $('<div class="chat_right">');
                        contentDiv.text(chatContent);
                        $('.messageArea').append(contentDiv);
                        console.log("senderCheck : "+msg.senderCheck);
                        $('.chatChkSpan').text('');
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
    }  
   

    function endChat(){
        const data = {type:"logout",memberId:memberId}
        ws.send(JSON.stringify(data));
        
    }