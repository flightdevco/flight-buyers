Config = {}

Config.Framework = "qb"
-- "qb" for qb-core
-- "qbx" for qbox-core
-- "esx" for esx framework

Config.Target = "qb"
-- "ox" for ox_target
-- "qb" for qb-target

Config.Inventory = "qb"
-- "ox" for ox_inventory
-- "qb" for qb-core, ps-inventory, qs-inventory and any inventory that support qb-core

Config.Shops = {
    [1] = {
        name = "Pence the Fence Lacke",     -- Target Name
        RandomLocation = false,             -- either choose a one random location or all locations
        Locations = {
            [1] = {
                coords = vector3(1555.69, 2157.98, 81.03),
                heading = 85.15,
                availableTime = {
                    open = 0,
                    close = 6,
                },
            },
            [2] = {
                coords = vector3(715.37, 4095.6, 33.73),
                heading = 165.83,
                availableTime = {
                    open = 0,
                    close = 17,
                },
            },
            [3] = {
                coords = vector3(1120.80, -2166.80, 30.85),
                heading = 174.08,
                availableTime = {
                    open = 0,
                    close = 24,
                },
            },
        },
        Dispatch = {
            toggle = false,     -- toggle dispatch upon selling
            chance = 0          -- chance of dispatch
        },
        Blip = {
            toggle = false,     -- toggle blip
            sprite = 52,
            color = 2,
            label = "Pence the Fence Lacke",     -- blip label
        },
        Ped = {
            model = "IG_JimmyDiSanto2",
            scenarion = "WORLD_HUMAN_DRUG_DEALER",
        },
        Items = {
            [1] = {
                item = "goldchain",               -- Item name
                label = "Gold Chain",             -- Item label on the menu
                price = math.random(75, 100),     -- Item price
                Limit = {
                    toggle = true,                -- toggle limit
                    limit = 150                   -- Limit of the item that can be sold per restart
                }
            },
            [2] = {
                item = "gold_ring",
                label = "Gold Ring",
                price = math.random(75, 100),
                Limit = {
                    toggle = true,
                    limit = 150
                }
            },
            [3] = {
                item = "diamond_ring",
                label = "Diamond Ring",
                price = math.random(150, 200),
                Limit = {
                    toggle = true,
                    limit = 50
                }
            },
            [4] = {
                item = "ruby_ring",
                label = "Ruby Ring",
                price = math.random(100, 150),
                Limit = {
                    toggle = true,
                    limit = 75
                }
            },
            [5] = {
                item = "sapphire_ring",
                label = "Sapphire Ring",
                price = math.random(100, 150),
                Limit = {
                    toggle = true,
                    limit = 75
                }
            },
            [6] = {
                item = "emerald_ring",
                label = "Emerald Ring",
                price = math.random(100, 150),
                Limit = {
                    toggle = true,
                    limit = 75
                }
            },
            [7] = {
                item = "silver_ring",
                label = "Silver Ring",
                price = math.random(50, 75),
                Limit = {
                    toggle = true,
                    limit = 250
                }
            },
            [8] = {
                item = "diamond_ring_silver",
                label = "Silver Diamond Ring",
                price = math.random(100, 200),
                Limit = {
                    toggle = true,
                    limit = 75
                }
            },
            [9] = {
                item = "ruby_ring_silver",
                label = "Silver Ruby Ring",
                price = math.random(75, 150),
                Limit = {
                    toggle = true,
                    limit = 85
                }
            },
            [10] = {
                item = "sapphire_ring_silver",
                label = "Silver Sapphire Ring",
                price = math.random(75, 150),
                Limit = {
                    toggle = true,
                    limit = 85
                }
            },
            [11] = {
                item = "emerald_ring_silver",
                label = "Silver Emerald Ring",
                price = math.random(75, 150),
                Limit = {
                    toggle = true,
                    limit = 85
                }
            },
            [12] = {
                item = "diamond_necklace",
                label = "Diamond Necklace",
                price = math.random(150, 250),
                Limit = {
                    toggle = true,
                    limit = 50
                }
            },
            [13] = {
                item = "ruby_necklace",
                label = "Ruby Necklace",
                price = math.random(100, 100),
                Limit = {
                    toggle = true,
                    limit = 75
                }
            },
            [14] = {
                item = "sapphire_necklace",
                label = "Sapphire Necklace",
                price = math.random(100, 100),
                Limit = {
                    toggle = true,
                    limit = 75
                }
            },
            [15] = {
                item = "emerald_necklace",
                label = "Emerald Necklace",
                price = math.random(100, 100),
                Limit = {
                    toggle = true,
                    limit = 75
                }
            },
            [16] = {
                item = "silverchain",
                label = "Silver Chain",
                price = math.random(50, 75),
                Limit = {
                    toggle = true,
                    limit = 400
                }
            },
            [17] = {
                item = "diamond_necklace_silver",
                label = "Silver Diamond Necklace",
                price = math.random(100, 200),
                Limit = {
                    toggle = true,
                    limit = 75
                }
            },
            [18] = {
                item = "ruby_necklace_silver",
                label = "Silver Ruby Necklace",
                price = math.random(100, 150),
                Limit = {
                    toggle = true,
                    limit = 85
                }
            },
            [19] = {
                item = "sapphire_necklace_silver",
                label = "Silver Sapphire Necklace",
                price = math.random(100, 150),
                Limit = {
                    toggle = true,
                    limit = 85
                }
            },
            [20] = {
                item = "emerald_necklace_silver",
                label = "Silver Emerald Necklace",
                price = math.random(100, 150),
                Limit = {
                    toggle = true,
                    limit = 85
                }
            },
            [21] = {
                item = "goldearring",
                label = "Gold Earring",
                price = math.random(50, 75),
                Limit = {
                    toggle = true,
                    limit = 150
                }
            },
            [22] = {
                item = "diamond_earring",
                label = "Diamond Earring",
                price = math.random(100, 200),
                Limit = {
                    toggle = true,
                    limit = 50
                }
            },
            [23] = {
                item = "ruby_earring",
                label = "Ruby Earring",
                price = math.random(75, 100),
                Limit = {
                    toggle = true,
                    limit = 75
                }
            },
            [24] = {
                item = "sapphire_earring",
                label = "Sapphire Earring",
                price = math.random(75, 100),
                Limit = {
                    toggle = true,
                    limit = 150
                }
            },
            [25] = {
                item = "emerald_earring",
                label = "Emerald Earring",
                price = math.random(75, 100),
                Limit = {
                    toggle = true,
                    limit = 150
                }
            },
            [26] = {
                item = "silverearring",
                label = "Silver Earring",
                price = math.random(75, 75),
                Limit = {
                    toggle = true,
                    limit = 175
                }
            },
            [27] = {
                item = "diamond_earring_silver",
                label = "Silver Diamond Earring",
                price = math.random(100, 150),
                Limit = {
                    toggle = true,
                    limit = 175
                }
            },
            [28] = {
                item = "ruby_earring_silver",
                label = "Silver Ruby Earring",
                price = math.random(100, 100),
                Limit = {
                    toggle = true,
                    limit = 175
                }
            },
            [29] = {
                item = "sapphire_earring_silver",
                label = "Silver Sapphire Earring",
                price = math.random(100, 100),
                Limit = {
                    toggle = true,
                    limit = 175
                }
            },
            [30] = {
                item = "emerald_earring_silver",
                label = "Silver Emerald Earring",
                price = math.random(100, 100),
                Limit = {
                    toggle = true,
                    limit = 175
                }
            },
            [31] = {
                item = "10kgoldchain",
                label = "10k Gold Chain",
                price = math.random(150, 200),
                Limit = {
                    toggle = true,
                    limit = 100
                }
            },
            [32] = {
                item = "rolex",
                label = "Golden Watch",
                price = math.random(150, 200),
                Limit = {
                    toggle = true,
                    limit = 100
                }
            },
            [33] = {
                item = "carradio",
                label = "Car Radio",
                price = math.random(45, 55),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [34] = {
                item = "yphone",
                label = "phone",
                price = math.random(25, 50),
                Limit = {
                    toggle = true,
                    limit = 500
                }
            },
            [35] = {
                item = "laptop",
                label = "Laptop",
                price = math.random(75, 100),
                Limit = {
                    toggle = true,
                    limit = 150
                }
            },
            [36] = {
                item = "painting",
                label = "Painting",
                price = math.random(50, 200),
                Limit = {
                    toggle = true,
                    limit = 50
                }
            },
            [37] = {
                item = "harddrive",
                label = "Hard Drive",
                price = math.random(25, 50),
                Limit = {
                    toggle = true,
                    limit = 250
                }
            },
        }
    },
    [2] = {
        name = "Garbage Man",
        RandomLocation = false,
        Dispatch = {
            toggle = false,
            chance = 0
        },
        Locations = {
            [1] = {
                coords = vector3(-470.74, -1718.31, 17.7),
                heading = 273.3,
                availableTime = {
                    open = 0,
                    close = 24,
                },
            },
        },
        Blip = {
            toggle = true,
            sprite = 434,
            color = 2,
            label = "Garbage Man",
        },
        Ped = {
            model = "a_m_m_hillbilly_01",
            scenarion = "WORLD_HUMAN_DRUG_DEALER",
            heading = 0.0,
        },
        Items = {
            [1] = {
                item = "garbage",
                label = "Garbage",
                price = math.random(1, 2),
                Limit = {
                    toggle = true,
                    limit = 100
                }
            },
            [2] = {
                item = "can",
                label = "Empty Can",
                price = math.random(1, 2),
                Limit = {
                    toggle = true,
                    limit = 100
                }
            },
            [3] = {
                item = "bottle",
                label = "Empty Bottle",
                price = math.random(1, 2),
                Limit = {
                    toggle = true,
                    limit = 100
                }
            },
            [4] = {
                item = "trash",
                label = "Trash",
                price = math.random(1, 2),
                Limit = {
                    toggle = true,
                    limit = 100
                }
            },
            [5] = {
                item = "emptywinebottle",
                label = "Empty Glass Bottle",
                price = math.random(1, 2),
                Limit = {
                    toggle = true,
                    limit = 100
                }
            },
        }
    },
    [3] = {
        name = "Meat Grinder Shop",
        RandomLocation = false,
        Dispatch = {
            toggle = false,
            chance = 0
        },
        Locations = {
            [1] = {
                coords = vector3(-67.97, 6255.74, 30.09),
                heading = 130.64,
                availableTime = {
                    open = 0,
                    close = 24,
                },
            },
        },
        Blip = {
            toggle = true,
            sprite = 141,
            color = 49,
            label = "Meat Grinder Shop",
        },
        Ped = {
            model = "s_m_m_linecook",
            scenarion = "WORLD_HUMAN_CLIPBOARD",
            heading = 0.0,
        },
        Items = {
            [1] = {
                item = "bonemeal",
                label = "Bone Meal",
                price = math.random(7, 10),
                Limit = {
                    toggle = true,
                    limit = 250
                }
            },
            [2] = {
                item = "groundchicken",
                label = "Ground Chicken",
                price = math.random(11, 16),
                Limit = {
                    toggle = true,
                    limit = 250
                }
            },
            [3] = {
                item = "groundpork",
                label = "Ground Pork",
                price = math.random(11, 16),
                Limit = {
                    toggle = true,
                    limit = 250
                }
            },
            [4] = {
                item = "groundcoyote",
                label = "Ground Coyote",
                price = math.random(11, 16),
                Limit = {
                    toggle = true,
                    limit = 250
                }
            },
            [5] = {
                item = "groundvenasin",
                label = "Ground Venison",
                price = math.random(11, 16),
                Limit = {
                    toggle = true,
                    limit = 250
                }
            },
            [6] = {
                item = "groundmtlion",
                label = "Ground Mt Lion",
                price = math.random(11, 16),
                Limit = {
                    toggle = true,
                    limit = 250
                }
            },
            [7] = {
                item = "groundrabbit",
                label = "Ground Rabbit",
                price = math.random(11, 16),
                Limit = {
                    toggle = true,
                    limit = 250
                }
            },
        }
    },
    [4] = {
        name = "Butcher Shop",
        RandomLocation = false,
        Dispatch = {
            toggle = false,
            chance = 0
        },
        Locations = {
            [1] = {
                coords = vector3(994.48, -2162.58, 29.41),
                heading = 356.37,
                availableTime = {
                    open = 0,
                    close = 24,
                },
            },
        },
        Blip = {
            toggle = true,
            sprite = 141,
            color = 49,
            label = "Butcher Shop",
        },
        Ped = {
            model = "s_m_m_linecook",
            scenarion = "WORLD_HUMAN_CLIPBOARD",
            heading = 0.0,
        },
        Items = {
            [1] = {
                item = "animalbones",
                label = "Animal Bones",
                price = math.random(3, 6),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [2] = {
                item = "porkchop",
                label = "Pork Chop",
                price = math.random(6, 15),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [3] = {
                item = "porkbelly",
                label = "Pork Belly",
                price = math.random(6, 15),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [4] = {
                item = "porkribs",
                label = "Pork Ribs",
                price = math.random(8, 18),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [5] = {
                item = "ribeye",
                label = "Ribeye Steak",
                price = math.random(6, 9),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [6] = {
                item = "beefribs",
                label = "Beef Ribs",
                price = math.random(8, 15),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [7] = {
                item = "beefshortribs",
                label = "Beef Short Ribs",
                price = math.random(6, 9),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [8] = {
                item = "coyotemeat",
                label = "Coyote Meat",
                price = math.random(8, 15),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [9] = {
                item = "birdfeet",
                label = "Bird Feet",
                price = math.random(5, 5),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [10] = {
                item = "crowfeathers",
                label = "Crow Feathers",
                price = math.random(7, 11),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [11] = {
                item = "venasin",
                label = "Venison",
                price = math.random(6, 10),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [12] = {
                item = "deerribs",
                label = "Deer Ribs",
                price = math.random(8, 11),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [13] = {
                item = "tenpointbuck",
                label = "Trophy Buck",
                price = math.random(10, 12),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [14] = {
                item = "chickenbreast",
                label = "Chicken Breast",
                price = math.random(7, 9),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [15] = {
                item = "chickenwing",
                label = "Chicken Wing",
                price = math.random(10, 10),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [16] = {
                item = "chickenthigh",
                label = "Chicken Thigh",
                price = math.random(7, 9),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [17] = {
                item = "mtlionmeat",
                label = "Mt Lion Meat",
                price = math.random(10, 12),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [18] = {
                item = "rabbit",
                label = "Rabbit Meat",
                price = math.random(6, 9),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [19] = {
                item = "rabbitfur",
                label = "Rabbit Fur",
                price = math.random(14, 18),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [20] = {
                item = "mtlionfur",
                label = "Mt Lion Fur",
                price = math.random(14, 18),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
            [21] = {
                item = "coyotefur",
                label = "Coyote Fur",
                price = math.random(14, 18),
                Limit = {
                    toggle = true,
                    limit = 300
                }
            },
        }
    },
    [5] = {
        name = "Sleazy Investment Banker",
        RandomLocation = false,
        Dispatch = {
            toggle = false,
            chance = 0
        },
        Locations = {
            [1] = {
                coords = vector3(-1102.74, -1342.41, 3.55),
                heading = 130.00,
                availableTime = {
                    open = 0,
                    close = 24,
                },
            },
        },
        Blip = {
            toggle = false,
            sprite = 434,
            color = 2,
            label = "Sleazy Investment Banker",
        },
        Ped = {
            model = "U_M_M_BankMan",
            scenarion = "PROP_HUMAN_SEAT_COMPUTER_LOW",
            heading = 0.0,
        },
        Items = {
            [1] = {
                item = "markedbills",
                label = "Marked Bills",
                price = math.random(1, 1),
                Limit = {
                    toggle = true,
                    limit = 500000
                }
            },
        }
    },
}