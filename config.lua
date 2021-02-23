--##################################--
-- Create by Parchoquer
--##################################--

config = {}
config.openMenu = 166 -- F5 > https://docs.fivem.net/docs/game-references/controls/
config.subtitle = '~b~Custom Your Title' -- Title of menu
config.banner = 'graph0001' -- Banner name
config.cooldown = 5000 -- In ms
config.lang = 'fr'

config.cars = {

    ['Audi'] = {
        { name = 'Adder', model = 'adder' },
		{ name = 'Futo', model = 'futo' },
		{ name = 'Zentorno', model = 'zentorno' },
    },
    ['BMW'] = {
		{ name = 'Adder', model = 'adder' },
		{ name = 'Futo', model = 'futo' },
		{ name = 'Zentorno', model = 'zentorno' },
	},
	['Mercedes'] = {
		{ name = 'Blista', model = 'blista' },
		{ name = 'Mule', model = 'mule' },
		{ name = 'T20', model = 't20' },
    },
    -- ['Subaru'] = {
	-- 	{ name = 'Blista', model = 'blista' },
	-- 	{ name = 'Mule', model = 'mule' },
	-- 	{ name = 'T20', model = 't20' },
	-- },
}

config.languages = {
    ['fr'] = {
        ['invalidModel'] = '~r~ Modèle invalide !',
        ['loadCar'] = 'Votre véhicule charge veuillez patienter',
        ['deleteOldCar'] = 'Supprimer le véhicule actuel',
    },
    ['en'] = {
        ['invalidModel'] = '~r~ Invalid model !',
        ['loadCar'] = 'Your vehicle load please wait',
        ['deleteOldCar'] = 'Delete current vehicle',
    }
}