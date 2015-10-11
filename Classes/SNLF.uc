
class SNLF extends ROMutator
	config (SNLF);

var config array<String> WhitelistedMaps;
var config bool ActiveOnAllMaps;

var array<RORoleInfoClasses> SNLF;

simulated function PreBeginPlay()
{
	local int i;
	
	local bool		MapOK;
	local String	MapName;
	MapName = WorldInfo.GetMapName(true);
	
	if ( !WorldInfo.GetMapInfo().IsA( 'RSMapInfo' ) )
	{
		`warn( "(BetaSNLF) Map is not RS, exiting!" );
		return;
	}
	
	`log( "(BetaSNLF) ActiveOnAllMaps = "$ActiveOnAllMaps );
	
	if ( !ActiveOnAllMaps )
	{
		`log( "(BetaSNLF) Will only activate on certain maps..." );
		
		if ( RSMapInfo( WorldInfo.GetMapInfo() ).AxisUniform != AXA_SNLF )
		{
			`log( "(BetaSNLF) SNLF not present on map, checking whitelist..." );
			`log( "(BetaSNLF) MapName = "$MapName );
			
			MapOK = false;
			
			if ( WhitelistedMaps.length != 0 )
			{
				`log( "(BetaSNLF) Whitelisted maps:" );
				for ( i = 0; i < WhitelistedMaps.length; i++ )
				{
					`log( "(BetaSNLF) "$WhitelistedMaps[i] );
				}
				
				for ( i = 0; i < WhitelistedMaps.length; i++ )
				{
					if ( MapName == WhitelistedMaps[i] )
					{
						`log( "(BetaSNLF) Map is listed..." );
						MapOK = true;
						break;
					}
				}
			}
			else
			{
				`log( "(BetaSNLF) List is empty..." );
			}
		}
		else
		{
			MapOK = true;
		}
	}
	
	if ( ActiveOnAllMaps || MapOK )
	{
		ParseGame();
	}
	else
	{
		`log( "(BetaSNLF) Invalid map, exiting." );
		return;
	}
}

function ParseGame()
{
	local int i;
	
	local ROGameInfo			ROGI;
	local RSGameInfoTerritories	RSGITE;
	local RSGameInfoFirefight		RSGIFF;
	local RSGameInfoCountdown	RSGICD;
	
	local int GameType;
	
	`log( "(BetaSNLF) Parsing game..." );
	
	ROGI = ROGameInfo ( WorldInfo.Game );
	GameType = ROGI.static.GetGameType();
	
	switch ( GameType )
	{
		case ROGT_Territory:
			`log( "(BetaSNLF) Game is Territories, replacing content..." );
			RSGITE = RSGameInfoTerritories ( WorldInfo.Game );
			for ( i = 0; i < SNLF.length; i++ ) { RSGITE.AxisIJARoleContentClasses[i] = SNLF[i]; }
			for ( i = 0; i < SNLF.length; i++ ) { RSGITE.AxisCamoRoleContentClasses[i] = SNLF[i]; }
			for ( i = 0; i < SNLF.length; i++ ) { RSGITE.AxisSNLFRoleContentClasses[i] = SNLF[i]; }
			`log( "(BetaSNLF) Content replaced, exiting." );
			return;
		
		case ROGT_Firefight:
			`log( "(BetaSNLF) Game is Firefight, replacing content..." );
			RSGIFF = RSGameInfoFirefight ( WorldInfo.Game );
			for ( i = 0; i < SNLF.length; i++ ) { RSGIFF.AxisIJARoleContentClasses[i] = SNLF[i]; }
			for ( i = 0; i < SNLF.length; i++ ) { RSGIFF.AxisCamoRoleContentClasses[i] = SNLF[i]; }
			for ( i = 0; i < SNLF.length; i++ ) { RSGIFF.AxisSNLFRoleContentClasses[i] = SNLF[i]; }
			`log( "(BetaSNLF) Content replaced, exiting." );
			return;
			
		case ROGT_Countdown:
			`log( "(BetaSNLF) Game is Countdown, replacing content..." );
			RSGICD = RSGameInfoCountdown ( WorldInfo.Game );
			for ( i = 0; i < SNLF.length; i++ ) { RSGICD.AxisIJARoleContentClasses[i] = SNLF[i]; }
			for ( i = 0; i < SNLF.length; i++ ) { RSGICD.AxisCamoRoleContentClasses[i] = SNLF[i]; }
			for ( i = 0; i < SNLF.length; i++ ) { RSGICD.AxisSNLFRoleContentClasses[i] = SNLF[i]; }
			`log( "(BetaSNLF) Content replaced, exiting." );
			return;
		
		default:
			`warn( "(BetaSNLF) Unknown GameType, exiting!" );
			return;
	}
}

defaultproperties
{
	SNLF(0)=(LevelContentClasses=(	"BetaSNLF.L1Rifleman",		"BetaSNLF.L2Rifleman",		"BetaSNLF.L3Rifleman",		"BetaSNLF.L4Rifleman",		"BetaSNLF.L5Rifleman",		"BetaSNLF.L6Rifleman"		))
	SNLF(1)=(LevelContentClasses=(	"BetaSNLF.L1Engineer",		"BetaSNLF.L2Engineer",		"BetaSNLF.L3Engineer",		"BetaSNLF.L4Engineer",		"BetaSNLF.L5Engineer",		"BetaSNLF.L6Engineer"		))
	SNLF(7)=(LevelContentClasses=(	"BetaSNLF.L1LightMortar",		"BetaSNLF.L2LightMortar",		"BetaSNLF.L3LightMortar",		"BetaSNLF.L4LightMortar",		"BetaSNLF.L5LightMortar",		"BetaSNLF.L6LightMortar"		))
	SNLF(3)=(LevelContentClasses=(	"BetaSNLF.L1MGer",			"BetaSNLF.L2MGer",			"BetaSNLF.L3MGer",			"BetaSNLF.L4MGer",			"BetaSNLF.L5MGer",			"BetaSNLF.L6MGer"			))
	SNLF(4)=(LevelContentClasses=(	"BetaSNLF.L1Sniper",		"BetaSNLF.L2Sniper",		"BetaSNLF.L3Sniper",		"BetaSNLF.L4Sniper",		"BetaSNLF.L5Sniper",		"BetaSNLF.L6Sniper"			))
	SNLF(5)=(LevelContentClasses=(	"BetaSNLF.L1Engineer",		"BetaSNLF.L2Engineer",		"BetaSNLF.L3Engineer",		"BetaSNLF.L4Engineer",		"BetaSNLF.L5Engineer",		"BetaSNLF.L6Engineer"		))
	SNLF(9)=(LevelContentClasses=(	"BetaSNLF.L1SquadLeader",	"BetaSNLF.L2SquadLeader",	"BetaSNLF.L3SquadLeader",	"BetaSNLF.L4SquadLeader",	"BetaSNLF.L5SquadLeader",	"BetaSNLF.L6SquadLeader"	))
	SNLF(10)=(LevelContentClasses=(	"BetaSNLF.L1Commander",	"BetaSNLF.L2Commander",	"BetaSNLF.L3Commander",	"BetaSNLF.L4Commander",	"BetaSNLF.L5Commander",	"BetaSNLF.L6Commander"	))
}
