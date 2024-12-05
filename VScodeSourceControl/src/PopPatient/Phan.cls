Class PopPatient.Phan Extends (%Persistent, %Populate) [ DdlAllowed ]
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
            // edit to push to branch
}

Storage Default
{
<Data name="PhanDefaultData">
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
<DataLocation>^PopPatient.PhanD</DataLocation>
<DefaultData>PhanDefaultData</DefaultData>
<IdLocation>^PopPatient.PhanD</IdLocation>
<IndexLocation>^PopPatient.PhanI</IndexLocation>
<StreamLocation>^PopPatient.PhanS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
