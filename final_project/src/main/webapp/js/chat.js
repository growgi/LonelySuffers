let ws;
let memberId;
function startChatBtn(memberIdParam){
    memberId = memberIdParam;
    console.log("memberId : "+memberId);
    ws = new WebSocket("ws://192.168.10.4/startChat.do");
    ws.onopen = startChat;
    ws.onmessage = receveMsg;
    ws.onclose = endChat;
    $('[name=startChatBtn]').hide();
    $('.chatting').slideDown();    
};
    
// function chatList(memberId){
//     $.ajax({
//         url : "/chatList.do",
//         type : "POST",
//         data : {memberId,memberId},
//         success : function(list){
//             for(let i=0; i<list.lenght;i++){
//                 if(list[i].senderCheck == 1){
//                     const chatContent = list[i].chatContent;
//                     const chatDate = list[i].chatDate;
//                     const idDiv = $('<div class="idDiv">');
//                     idDiv.text("관리자");
//                     const contentDiv = $('<div class="chat_left">');
//                     contentDiv.text(chatContent);
//                     $('.messageArea').append(idDiv).append(contentDiv);
//                 }else{
//                     const chatContent = list[i].chatContent;
//                     const chatDate = list[i].chatDate;
//                     const contentDiv = $('<div class="chat_right">');
//                     contentDiv.text(chatContent);
//                     $('.messageArea').append(contentDiv);
//                 }
//             }
//         }
//     });
// }

    function startChat(){
        const data = {type:"start",msg:memberId};
        ws.send(JSON.stringify(data));
    }

    function receveMsg(param){
        const result = JSON.parse(param.data);
        console.log(result);
        if(result.type == "startCondition"){
            if(result.msg == "ok"){
                getChatList();
            }else{
                alert("다시 시도해주세요");
            }
        }else if(result.type == "sendCondition"){
            if(result.msg == "ok"){
                getChatList();
            }else{
                alert("다시 시도해주세요.");
            }
        }
    }
    function endChat(){

    }

    function getChatList(){
        $.ajax({
            url : "/chatList.do",
            type : "POST",
            data : {memberId:memberId},
            success : function(list){
                console.log(list);
                $('.messageArea').empty();
                for(let i=0; i<list.length;i++){
                    console.log('하이');
                    const msg = list[i];
                    console.log("SenderCheck : "+msg.senderCheck);
                    if(list[i].senderCheck == 2){
                        const chatContent = list[i].chatContent;
                        const chatDate = list[i].chatDate;
                        const idDiv = $('<div class="idDiv">');
                        idDiv.text("관리자");
                        const contentDiv = $('<div class="chat_left">');
                        contentDiv.text(chatContent);
                        $('.messageArea').append(idDiv).append(contentDiv);
                    }else{
                        const chatContent = list[i].chatContent;
                        const chatDate = list[i].chatDate;
                        const contentDiv = $('<div class="chat_right">');
                        contentDiv.text(chatContent);
                        $('.messageArea').append(contentDiv);
                    }     
                }
                $('.messageArea').scrollTop($('.messageArea')[0].scrollHeight);
            }
        })
    }

    function sendMsg(){
        const msg = $('#sendMsg').val();
        console.log(msg);
        if(msg != ""){
            const data = {type:"send",msg:msg,sender:memberId};
            ws.send(JSON.stringify(data));
        }
    }