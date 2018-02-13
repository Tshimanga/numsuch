use NumSuch,
    Postgres,
    Time;

// PERFORMANCE BENCHMARKS FOR MATRIX DB INTERACTIONS

// RESULTS ARE AT THE BOTTOM OF THE FILE IN A MULTILINE COMMENT


// postgresql://buddha:D6Adisco!!@172.18.0.6/loch_brian

config const DB_HOST: string = "52.176.63.131";
config const DB_USER: string = "buddha";
config const DB_NAME: string = "loch_brian";
config const DB_PWD: string = "D6Adisco!!";
var con = PgConnectionFactory(host=DB_HOST, user=DB_USER, database=DB_NAME, passwd=DB_PWD);

var nameTable = "r.cui_confabulation",
    idField = "ftr_id",
    nameField = "source_str",
    edgeTable1 = "r.cui_confabulation",
    fromField1 = "source_cui",
    toField1 = "exhibited_cui",
    wField1 = "NONE",
    wTable = "cc_weight",
    n = 8;

var X = new NamedMatrix();
var t: Timer;
t.start();
X.fromPG(con, edgeTable = edgeTable1, fromField = fromField1, toField = toField1);
t.stop();
writeln("Time to load NamedMatrix of CUIs: %n".format(t.elapsed))
//writeln(X.domain);
