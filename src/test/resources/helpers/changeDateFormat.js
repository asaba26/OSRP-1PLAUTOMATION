function(date1,format1,format2) {
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat(format1);
    var sdf2 = new SimpleDateFormat(format2);
    var ss = sdf.parse(date1);
    return sdf2.format(ss);

 }