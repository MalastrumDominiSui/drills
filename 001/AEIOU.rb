def vowelequals(arrayWords) 
    arrayLength = arrayWords.length
       for i in 0...arrayLength
            if (voweler(arrayWords[i]) != "aeiou")
            
             
        
    console.log(arrayWords);
    return (arrayWords);
    


def voweler(string) 
    stringArray = string.split("")
    length = stringArray.length
 
    for i in 0...(length-1)
        if stringArray[i] != 'a' && stringArray[i] != 'e' && stringArray[i] != 'i' && stringArray[i] != 'o' && stringArray[i] != 'u'  
          stringArray[i] = ""
        
    
    return (stringArray.join(""))
    
voweler "moocows"

 bigArray = ["absconder", "absconders", "absconding", "absconds", "abseil", "abseiled", "abseiling", "abseils", "absence", "absences", "absent", "absented", "absentee", "absenteeism", "absenteeisms", "absentees", "absenter", "absenters", "absenting", "absently", "absentminded", "absentmindedly", "absentmindedness", "absentmindednesses", "absents", "absinth", "absinthe", "absinthes", "absinths", "absolute", "absolutely", "absoluteness", "absolutenesses", "absoluter", "absolutes", "absolutest", "absolution", "absolutions", "absolutism", "absolutisms", "absolutist", "absolutistic", "absolutists", "absolutive", "absolutize", "absolutized", "absolutizes", "absolutizing", "absolve", "absolved", "absolver", "absolvers", "absolves", "absolving", "absonant", "absorb", "absorbabilities", "absorbability", "absorbable", "absorbance", "absorbances", "absorbancies", "absorbancy", "absorbant", "absorbants", "absorbed", "absorbencies", "absorbency", "absorbent", "absorbents", "absorber", "absorbers", "absorbing", "absorbingly", "absorbs", "absorptance", "absorptances", "absorption", "absorptions", "absorptive", "absorptivities", "absorptivity", "absquatulate", "absquatulated", "absquatulates", "absquatulating", "abstain", "abstained", "abstainer", "abstainers", "abstaining", "abstains", "abstemious", "abstemiously", "abstemiousness", "abstemiousnesses", "abstention", "abstentions", "abstentious", "absterge"]