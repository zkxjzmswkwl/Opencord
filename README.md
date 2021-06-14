# Opencord
Opencord's goal is to offer a plug-and-play replacement for Discord. Though getting your friends to switch isn't really an option, most of the time... For that, I will be releasing a solution that allows you to use dummy/proxy accounts to still communicate with your friends via Discord without having to run the horrendous Discord client.

Discord started as something pretty cool but has since devolved into something dreadful. The list below contains my opinions of why Discord has broke bad.

1. Security - Recently a horrendously poorly-written Python script was able to steal Discord accounts and bypass 2Factor authentication. How, you ask? Simple. By taking the user's token. Discord recently celebrated I think their 6th or 7th anniversary. They've been around for that long and have failed to implement checks when authenticating a user's token to ensure that the token is being used from the same machine it was generated on. Inexcusable.

2. Discord's Electron-based client is a piece of shit and will never get better.

3. Implementing silly frills like "badges" only opens up a market for rare badges which is entirely fueled by stolen accounts. This in combination with Discord's lack of integrity insurance on authentication results in the current climate: Teenagers writing shit Python scripts to steal accounts that have pointless badges to then sell to another teenager for $12.

4. They wrote an application targeting gamers, a group of people who **very much** need performance. They then wrote the entire thing in Javascript because it's easier to find cheap developers to pump out mediocre code for a mediocre language than it is to find and properly pay competent developers.


