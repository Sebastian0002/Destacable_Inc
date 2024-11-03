const { Data } = require("../models/data")


const getInitialdataUser1 = () => {

    const data = [];

    data.push(new Data({bank_name: "Banco del Pueblo", amount:  10000000, rate: 10, start_date: new Date("1/1/2024"), 
        end_date: new Date("1/1/2025"),
        roi:  11000000
    }));
    data.push(new Data({bank_name: "Banco del Pueblo", amount:  15000000, rate: 9,start_date: new Date("2/1/2024"),
        end_date: new Date("2/1/2026"),
        roi:  17700000
    }));
    data.push(new Data({bank_name: "Banco Comunal", amount:  20000000, rate: 11,start_date: new Date("3/1/2024"),
        end_date: new Date("3/1/2025"),
        roi:  11000000
    }));
    data.push(new Data({bank_name: "Banco de Inversiones", amount:  5000000, rate: 10.5,start_date: new Date("4/1/2024"),
        end_date: new Date("10/1/2024"),
        roi:  11000000
    }));
    data.push(new Data({bank_name: "Banco del Pueblo", amount:  8000000, rate: 12,start_date: new Date("5/1/2024"),
        end_date: new Date("11/1/2024"),
        roi:  11000000
    }));
    data.push(new Data({bank_name: "Banco Comunal", amount:  25000000, rate: 8,start_date: new Date("6/1/2024"),
        end_date: new Date("6/1/2025"),
        roi:  11000000
    }));
    data.push(new Data({bank_name: "Banco de Inversiones", amount:  30000000, rate: 10,start_date: new Date("7/1/2024"),
        end_date: new Date("1/1/2025"),
        roi:  11000000
    }));
    data.push(new Data({bank_name: "Banco del Pueblo", amount:  12000000, rate: 11.5,start_date: new Date("8/1/2024"),
        end_date: new Date("8/1/2025"),
        roi:  11000000
    }));
    data.push(new Data({bank_name: "Banco de Ahorros", amount:  18000000, rate: 9.5,start_date: new Date("9/1/2024"),
        end_date: new Date("12/1/2024"),
        roi:  11000000
    }));
    data.push(new Data({bank_name: "Banco de Inversiones", amount:  22000000, rate: 10,start_date: new Date("10/1/2024"),
        end_date: new Date("10/1/2025"),
        roi:  11000000
    }));

    return data

}

const getInitialdataUser2 = () => {

    const data = [];

    data.push(new Data({bank_name: "Banco del Futuro", amount:  9000000, rate: 10.5, start_date: new Date("11/1/2024"), 
        end_date: new Date("2/1/2025"),
        roi:  9236250
    }));
    data.push(new Data({bank_name: "Banco Comunal", amount:  14000000, rate: 9.2,start_date: new Date("12/1/2024"),
        end_date: new Date("12/1/2025"),
        roi:  15288000
    }));
    data.push(new Data({bank_name: "Banco Inversiones", amount:  7500000, rate: 11,start_date: new Date("1/1/2025"),
        end_date: new Date("1/1/2027"),
        roi:  9150000
    }));
    data.push(new Data({bank_name: "Banco del Futuro", amount:  11000000, rate: 10,start_date: new Date("2/1/2025"),
        end_date: new Date("2/1/2027"),
        roi:  13200000
    }));
    data.push(new Data({bank_name: "Banco de Ahorros", amount:  6000000, rate: 9.5,start_date: new Date("3/1/2025"),
        end_date: new Date("3/1/2026"),
        roi:  6570000
    }));
    data.push(new Data({bank_name: "Banco Inversiones", amount:  20000000, rate: 8.5, start_date: new Date("4/1/2025"),
        end_date: new Date("10/1/2026"),
        roi:  22550000
    }));
    data.push(new Data({bank_name: "Banco del Futuro", amount:  13500000, rate: 10, start_date: new Date("5/1/2023"),
        end_date: new Date("5/1/2024"),
        roi:  14850000
    }));
    data.push(new Data({bank_name: "Banco de Ahorros", amount:  15000000, rate: 11.5, start_date: new Date("6/1/2025"),
        end_date: new Date("12/1/2025"),
        roi:  15862500
    }));
    data.push(new Data({bank_name: "Banco Inversiones", amount:  17000000, rate: 10.2, start_date: new Date("7/1/2025"),
        end_date: new Date("1/1/2026"),
        roi:  17867000
    }));
    data.push(new Data({bank_name: "Banco del Futuro", amount:  19000000, rate: 9.7, start_date: new Date("8/1/2025"),
        end_date: new Date("2/1/2027"),
        roi:  21764500
    }));

    return data

}

module.exports ={
    getInitialdataUser1,
    getInitialdataUser2,
}
