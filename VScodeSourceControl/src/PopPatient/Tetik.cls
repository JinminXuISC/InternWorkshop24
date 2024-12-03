Class PopPatient.Tetik Extends (%Persistent, %Populate) [ DdlAllowed ]
{

Property Name As %String;

Property Age As %Integer(MAXVAL = 90, MINVAL = 1);

Property PhoneNum As %Integer(POPSPEC = ".GenerateRandomMobileNumber()");

Property PostCode As %Integer;

ClassMethod GenerateRandomMobileNumber() As %Integer
{
            //Set countryCode = "+61"  
            Set areaCode = "04"
            Set firstPart = $RANDOM(900) + 100
            Set secondPart = $RANDOM(90000) + 10000
            Set randomMobileNumber =  areaCode _ firstPart _ secondPart
            //write randomMobileNumber
            Quit randomMobileNumber
}

Storage Default
{
<Data name="TetikDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Age</Value>
</Value>
<Value name="4">
<Value>PhoneNum</Value>
</Value>
<Value name="5">
<Value>PostCode</Value>
</Value>
</Data>
<DataLocation>^PopPatient.TetikD</DataLocation>
<DefaultData>TetikDefaultData</DefaultData>
<IdLocation>^PopPatient.TetikD</IdLocation>
<IndexLocation>^PopPatient.TetikI</IndexLocation>
<StreamLocation>^PopPatient.TetikS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
