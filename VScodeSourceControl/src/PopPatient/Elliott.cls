Class PopPatient.Elliott Extends (%Persistent, %Populate) [ DdlAllowed ]
{

// name of the generated patient

Property Name As %String;

// age of the generated patient

Property Age As %Integer(MAXVAL = 90, MINVAL = 1);

// phone number of the generated patient

Property PhoneNum As %Integer(POPSPEC = ".GenerateRandomMobileNumber()");

// post code of the generated patient

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
<Data name="ElliottDefaultData">
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
<DataLocation>^PopPatient.ElliottD</DataLocation>
<DefaultData>ElliottDefaultData</DefaultData>
<IdLocation>^PopPatient.ElliottD</IdLocation>
<IndexLocation>^PopPatient.ElliottI</IndexLocation>
<StreamLocation>^PopPatient.ElliottS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
