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

}
