use NumSuch,
    Postgres;

config const DB_HOST: string = "";
config const DB_USER: string = "";
config const DB_NAME: string = "";
config const DB_PWD: string = "";

if DB_HOST == "" {
  var msg = """
Cannot find the file 'db_creds.txt'.  Please create it in the current directory with the fields

DB_HOST=
DB_USER=
DB_NAME=
DB_PWD=

And DO NOT check it into GitHub. (In fact, Git will try to ignore it.)
  """;
  writeln(msg);
  halt();
}

var con = PgConnectionFactory(host=DB_HOST, user=DB_USER, database=DB_NAME, passwd=DB_PWD);

var nameTable = "r.cho_names",
    idField = "ftr_id",
    nameField = "name",
    edgeTable = "r.cho_edges",
    fromField = "from_fid",
    toField = "to_fid",
    wField = "w",
    wTable = "r.condition_w",
    n = 8;

// Should have loaded the data from test/reference/entropy_base_graph_schema.sql
var vnames = vNamesFromPG(con=con, nameTable=nameTable, nameField=nameField, idField=idField);
writeln(vnames);
var W = wFromPG(con=con, edgeTable=edgeTable, fromField, toField, wField, n=vnames.size);
writeln(W);

persistSparseMatrix(con, aTable=wTable, fromField=fromField, toField=toField, weightField=wField, A=W);
/* completes in about 160 seconds
var W2 = wFromPG(con=con, edgeTable="r.yummly_edges", fromField, toField, wField, n=6714);
*/
