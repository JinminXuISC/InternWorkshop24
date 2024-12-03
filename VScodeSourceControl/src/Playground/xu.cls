Class Playground.xu Extends %Persistent
{

ClassMethod nd2json() As %Status
{
	set file  = "C:\INTEROP\fullExport\Organization.json"
	set dir = "C:\INTEROP\fullExport\TestData"
	set stream = ##class(%Stream.FileCharacter).%New()
	do stream.LinkToFile(file)
	while 'stream.AtEnd {
		set currentDate = $H
    	set datePart = $ZDATE(currentDate, 3)  // yyyy-mm-dd
    	set timePart = $ZTIME(currentDate)      // hh:mm:ss
    	set timestampString = datePart_" "_timePart
        set json = stream.ReadLine($$$MaxStringLength)
        set tRequest = ##class(NHSDDemo.Msg.BSProcessed).%New()
        set tRequest.dateProcessed = timestampString
        do tRequest.content.Write(json)
        set tJSON = tRequest.content.Read()
        set dynObj = {}.%FromJSON(tJSON)
        set tRequest.fileName = dynObj.resourceType
        do tRequest.%Save()
        kill tRequest
    }
}

ClassMethod ShowDir(dir As %String = "", wildcard As %String = "", sort As %String = "Name") As %ListOfDataTypes
{
  set stmt = ##class(%SQL.Statement).%New()
  set status = stmt.%PrepareClassQuery("%File", "FileSet")
  if $$$ISERR(status) {write "%Prepare failed:" do $SYSTEM.Status.DisplayError(status) quit}

  set rset = stmt.%Execute(dir, wildcard, sort)
  if (rset.%SQLCODE '= 0) {write "%Execute failed:", !, "SQLCODE ", rset.%SQLCODE, ": ", rset.%Message quit}
  
  set fileList = ##class(%ListOfDataTypes).%New()
  
  while rset.%Next()
  {
    //write !, rset.%Get("Name")
    do fileList.Insert(rset.%Get("Name"))
  }
  if (rset.%SQLCODE < 0) {write "%Next failed:", !, "SQLCODE ", rset.%SQLCODE, ": ", rset.%Message quit}
  return fileList
}

Storage Default
{
<Data name="xuDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^Playground.xuD</DataLocation>
<DefaultData>xuDefaultData</DefaultData>
<IdLocation>^Playground.xuD</IdLocation>
<IndexLocation>^Playground.xuI</IndexLocation>
<StreamLocation>^Playground.xuS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
