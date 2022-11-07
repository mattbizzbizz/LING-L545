# Dependency Parsing
## Train, Parse, and Evaluate Using UDPipe Report

The parser incorrectly parses the universal dependency relations of words (e.j. the word "Cezveyi" in the sentence "Cezveyi sürüyor, fincana boşaltıyor, kahveyi afiyetle içiyordu." is parsed as an object instead of a compound),
it switches the universal dependency relations of words (e.j. the word "içiyordu" in the same sentence is parsed as the root of the sentence instead of the word "sürüyor"),
it incorrectly parses the heads of words (e.j. the first comma in the same sentence is parsed as having the head "sürüyor" instead of "boşaltıyor"),
and it does a combination of the previous incorrect parsings (e.j. the word "boşaltıyor" in the first sentence is parsed as having the head "içiyordu" and parsed as a parataxis instead of having the head "sürüyor" and parsed as a conjunction).
