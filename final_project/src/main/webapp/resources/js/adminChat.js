let ws;
let memberId;
$(function(){
    memberId = "admin";
    ws = new WebSocket("ws://192.168.10.18/chat.do");
    ws.onopen = startChat;
    ws.onmessage = receiveMsg;
    ws.onclose = endChat;
});

    function startChat() {
        const data = {type:"adminStart",memberId:memberId};
        ws.send(JSON.stringify(data));
    }

    function receiveMsg(){

    }
    function endChat(){

    }

$('.active_chat_title').on('click',function(){
    $(this).parent().next().children().toggleClass('active_chat_content');
    const memberId = $(this).children().val();
    $.ajax({
        url : "/chatList.do",
        type : "POST",
        data : {memberId:memberId},
        success : function(list){
            for(let i=0; i<list.length;i++){
                console.log('하이');
                const msg = list[i];
                console.log("SenderCheck : "+msg.senderCheck);
                if(list[i].senderCheck == 1){
                    const chatContent = list[i].chatContent;
                    const chatDate = list[i].chatDate;
                    const idDiv = $('<div class="idDiv">');
                    idDiv.text(list[i].memberId);
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
})


function sendMsg() {
    const msg = $('#sendMsg').val();
    const memberId = $(this).parent().parent().parent().parent().find('#memberId');
    console.log(memberId)
    if(msg != ""){
        const data = {type:"send",msg:msg}
    }
    
}
