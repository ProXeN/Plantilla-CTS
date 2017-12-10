class BRM_conversation_system
{
	class init {
		file = "framework\plugins\conversation_system\functions";
		class preInit {preInit = 1;};
		class postInit {postInit = 1;};
	};
	class Functions {
		file = "framework\plugins\conversation_system\functions";
		class addConversationLocal {};
		class addConversationMP {};
		class ambientChatter {};
		class ambientChatterKB {};
		class closeConversation {};
		class openConversation {};
		class removeConversation {};
		class selectResponse {};
		class simpleConversationLocal {};
		class simpleConversationMP {};
		class simpleConversationKB {};
		class simpleSentenceLocal {};
		class simpleSentenceMP {};
		class simpleSentenceKB {};
	};
};
