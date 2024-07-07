import moment from "moment"

class DateHelper {
    static format: string = "YYYY-MM-DD HH:mm:ss";

    static formatDate(date: Date) {
        return moment(date).format(DateHelper.format);
    }

    static getCurrentDate() {
        return moment().format(DateHelper.format);
    }
}

export default DateHelper