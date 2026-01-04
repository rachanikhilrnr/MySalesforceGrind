public class TextFormatting {
    public static String cleanText(String input) {
        if (input == null || input == '') {
            return input;
        }
    
        // Map of problematic Unicode code points (decimal) to replacement strings
        // You can extend this map with more if needed
        Map<Integer, String> replacementMap = new Map<Integer, String>{
            8216 => '\'',  // ‘ Left single quotation mark → '
            8217 => '\'',  // ’ Right single quotation mark (apostrophe) → '
            8218 => '\'',  // ‚ Single low-9 quotation mark → '
            8220 => '"',   // “ Left double quotation mark → "
            8221 => '"',   // ” Right double quotation mark → "
            8222 => '"',   // „ Double low-9 quotation mark → "
            8211 => '-',   // – En dash → -
            8212 => '-',   // — Em dash → -
            8230 => '...', // … Horizontal ellipsis → ...
            8226 => '*',   // • Bullet → *
            183  => '*',   // · Middle dot → *
            9702 => 'o',   // ◦ White bullet → o
            171  => '"',   // « Left-pointing double angle quotation → "
            187  => '"',   // » Right-pointing double angle quotation → "
            8249 => '\'',  // ‹ Single left-pointing angle quotation → '
            8250 => '\'',  // › Single right-pointing angle quotation → '
            8482 => '(TM)',// ™ Trademark → (TM)
            174  => '(R)', // ® Registered → (R)
            169  => '(C)'  // © Copyright → (C)
        };
    
        String cleaned = '';
        
        for (Integer i = 0; i < input.length(); i++) {
            Integer codePoint = input.charAt(i);  // Gets the Unicode code point (as Integer)
            
            if (replacementMap.containsKey(codePoint)) {
                cleaned += (replacementMap.get(codePoint));
            } else {
                cleaned += (input.substring(i, i + 1));
            }
        }
        
        return cleaned.toString();
    }
}