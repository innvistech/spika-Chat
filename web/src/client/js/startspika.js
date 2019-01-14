
SpikaAdapter.attach({

    spikaURL: Config.SpikaBaseURL,
    attachTo : "chat", // id or div to show into
    user : {
        id : UserManager.user.id,
        name : UserManager.user.name,
        avatarURL : UserManager.user.avatar,
        roomID : channel
    },
    config : {
        apiBaseUrl : window.location.origin + Config.SpikaBaseURL + "/v1",
        socketUrl : window.location.origin + Config.SpikaBaseURL,
        showSidebar : false,
        showTitlebar : false
    },
    listener : {
    
        onPageLoad: function(){
            
        },
        onNewMessage:function(obj){
    
        },
        onNewUser:function(obj){
    
        },
        onUserLeft:function(obj){
    
        },
        OnUserTyping:function(obj){
    
        },
        OnMessageChanges:function(obj){
    
        },
        onOpenMessage:function(obj){
            return true;
        },
        OnOpenFile:function(obj){
            return true;
        }
    }
    
    });