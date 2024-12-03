Class PopPatient.test Extends (%Persistent, %Populate) [ DdlAllowed ]
{

Property Name As %String;

Property TestProperty As %String;

Property TestProperty2 As %String;

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
<Data name="testDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>TestProperty</Value>
</Value>
<Value name="4">
<Value>TestProperty2</Value>
</Value>
<Value name="5">
<Value>Age</Value>
</Value>
<Value name="6">
<Value>PhoneNum</Value>
</Value>
<Value name="7">
<Value>PostCode</Value>
</Value>
</Data>
<DataLocation>^PopPatient.testD</DataLocation>
<DefaultData>testDefaultData</DefaultData>
<IdLocation>^PopPatient.testD</IdLocation>
<IndexLocation>^PopPatient.testI</IndexLocation>
<StreamLocation>^PopPatient.testS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
