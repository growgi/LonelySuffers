$('.active_chat_title').on('click',function(){
    $(this).parent().next().children().toggleClass('active_chat_content');
    const memberId = $(this).children().val();
    const index = $('.active_chat_title').index(this);
    adminChatList(memberId,index);
})

function adminChatList(memberId,index){
    console.log("adminChatList index : "+index);
    $.ajax({
        url : "/chatList.do",
        type : "POST",
        data : {memberId:memberId},
        success : function(list){
        $('.adminMessageArea').eq(index).empty();
        for(let i=0; i<list.length;i++){
            const msg = list[i];
            console.log("SenderCheck : "+msg.senderCheck);
            if(list[i].senderCheck == 1){
                const chatContent = msg.chatContent;
                const chatDate = msg.chatDate;
                const dateDiv = $('<div class="dateDate">');
                dateDiv.text(chatDate);
                const idDiv = $('<div class="idDiv">');
                idDiv.text(msg.memberId);
                const contentDiv = $('<div class="chat_left">');
                contentDiv.text(chatContent);
                const containerDiv = $('<div class="containerDiv">');
                containerDiv.append(contentDiv).append(dateDiv);
                $('.adminMessageArea').eq(index).append(idDiv).append(containerDiv);
                $('.timeDiv').eq(index).text(chatDate);
                }else{
                const chatContent = list[i].chatContent;
                const chatDate = list[i].chatDate;
                const contentDiv = $('<div class="chat_right">');
                contentDiv.text(chatContent);
                $('.adminMessageArea').eq(index).append(contentDiv);
            }     
        }
        $('.adminMessageArea').eq(index).scrollTop($('.adminMessageArea')[index].scrollHeight);
        }
    });
}

function adminSendMsg(param) {
    const divValue = $('.active_chat_title');
    const memberId = param;
            for(let i=0;i<divValue.length;i++){
                const val = divValue.eq(i).attr('value');
                console.log(val);
                if(val==param){
                    console.log("i : "+i);
                    const msg = $('.adminSendInput').eq(i).val();
                    if(msg != ""){
                        const data = {type:"send",msg:msg,sender:memberId};
                        console.log(data);
                        ws.send(JSON.stringify(data));
                    }
                }
            }
}

$('.adminSendInput').on('keyup',function(e){
    if(e.keyCode == 13){
        $(this).next().click();
        $(this).val('');
    }

})
$(function(){
    $('.active_chat_title').click();
    $('.active_chat_title').click();
});
// function receiveMsg(param){
//     const data = JSON.parse(param.data);
//     console.log(data);
//     if(data.type == "sendCondition" && data.msg == "sendOk"){
//         const divValue = $('.active_chat_title');
//         for(let i=0;i<divValue.length;i++){
//             const val = divValue.eq(i).attr('value');
//             console.log(val);
//             console.log(data.sender);
//             if(val == data.sender){
//                 adminChatList(data.sender,i);
//             }
//         }
        
//     }
// }