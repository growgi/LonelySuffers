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

    }
    function endChat(){
        const data = {type:"logout",memberId:memberId}
        ws.send(JSON.stringify(data));
    }