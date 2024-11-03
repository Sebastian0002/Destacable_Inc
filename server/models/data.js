
class Data {
    constructor({
        bank_name = 'NN', 
        amount = 0, 
        rate = 0, 
        start_date = new Date(), 
        end_date = new Date(), 
        roi = 0}){
        this.bank_name = bank_name;
        this.amount = amount;
        this.rate = rate;
        this.start_date = start_date;
        this.end_date = end_date;
        this.roi = roi;
    }
}


module.exports = {
    Data
};
