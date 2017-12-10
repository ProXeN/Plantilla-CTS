class exit
{
	exit = 1;
	expression = "nul = [IP_Buddy, 'See ya!', 'DIRECT', 3] call BRM_conversation_system_fnc_simpleSentenceLocal;";
	sentences[] = {"Good bye!"};
};
class opener
{
	arguments[] = {"(name player)"};
	responses[] = {"survive", "buddy", "mercs", "maxwell", "stratis", "exit"};
	sentences[] = {
		"Hey, can I ask you something?",
		"Feel free, %1. What would you like to know?"
	};
};
class back
{
	responses[] = {"survive", "buddy", "mercs", "maxwell", "exit"};
	sentences[] = {
		"I'd like to know something else.",
		"Yes?"
	};
};
class survive
{
	responses[] = {"nikos", "slaves", "back", "exit"};
	sentences[] = {
		"Why am I still alive while the other refugees are dead?",
		"Because of two reasons. First: You are in good shape and seem to have some skills and combat experience we can use. Second: We needed only one replacement and you were the best Nikos had to offer. It's really that simple."
	};
};
class nikos
{
	responses[] = {"slaves", "back", "exit"};
	sentences[] = {
		"I am going to kill Nikos.",
		"Haha! Good luck with that! He doesn't really visit us on a regular basis and if he does, there are lots of trigger-happy mercs around.",
		"I don't care. Someday, I'll find him. And then I will bring him to justice.",
		"Justice! Good one! Words to the wise: Let it go. Focus on making some money to get off this rock and make yourself a good life instead of hunting a ghost.",
		"We'll see about that..."
	};
};
class slaves
{
	responses[] = {"nikos", "back", "exit"};
	sentences[] = {
		"Is slavery a common trait among you guys?",
		"We buy people from time to time to make up for our losses. McMillian came up with this idea. I don't like it but we don't really get reinforcements out here. And apart from that you're not exactly a slave. You get paid for what you do here. Do some work and you're free. Do some more work and you even make a buttload of money.",
		"I'm really flattered by your courtesy..."
	};
};
class buddy
{
	responses[] = {"back", "exit"};
	sentences[] = {
		"Tell me something about yourself.",
		"Not much to tell actually. I was born in Croatia, in a small village on the coast. Had to pick up a rifle during the second Balkan war and been making a living as PMC since. Joined the organisation couple of months ago. Good pay, free health care and a lot of action. I can't complain."
	};
};
class mercs
{
	responses[] = {"clients", "work", "back", "exit"};
	sentences[] = {
		"What is this 'organisation'? And what's my purpose here?",
		"The organisation is actually called 'ION Incorporated'. We're private military contractors and offer pretty much anything to anyone - as long as we get paid. Check out our website. You are now an independent contractor and will take some jobs in order to pay off your debts."
	};
};
class clients
{
	responses[] = {"suchas", "work", "back", "exit"};
	sentences[] = {
		"Who are our clients?",
		"Anybody. Mostly corporate organisations or governments. Sometimes military, sometimes private, sometimes we don't know. If you have money, we're your best friends.",
		"Also the European Federation?",
		"Yup! Sometimes even the fucking Blueflags. It totally pisses off the AAF but then again, they can't really do much about it. They need us to do their dirty work. So we have free hands to do jobs for whoever we want to. As long as we don't cross certain borders."
	};
};
class suchas
{
	responses[] = {"work", "back", "exit"};
	sentences[] = {
		"Such as?",
		"Killing Greenbags, blowing up one of their camps, stealing from their supply convoys - done it all. *grin*"
	};
};
class work
{
	responses[] = {"clients", "back", "exit"};
	sentences[] = {
		"How are our missions going to be like?",
		"Well, we take a ride to Altis, find some people, shoot some people, safe some people, gather intel, steal stuff - whatever the client is paying for. Lately hostage rescue operations are getting really popular. Shouldn't have re-opened the beaches for dumb tourists..."
	};
};
class maxwell
{
	responses[] = {"back", "exit"};
	sentences[] = {
		"I want to know more about this place here. Camp Maxwell, right?",
		"Yes, EUROFORCE originally build this camp as their HQ when the airport was still under construction. It was decommissioned long ago and then re-used by some survivors during the CSAT invasion two years ago. The defending EUROFORCE units were surrounded and outnumbered by CSAT but they held the line. Word says that more than 1000 men died trying to take this fucking rock. But that's just rumours I guess. Now we're using it. It's quite hard to find, has a lot of space, is easy to defend and there are not so many mines around."
	};
};
class stratis
{
	responses[] = {"back", "exit"};
	sentences[] = {
		"What do you know about this island?",
		"It's called 'Stratis' and it currently belongs to the Republic of Altis. But that's just recent history..."
	};
};
