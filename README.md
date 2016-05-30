# apex_clob_region
Apex CLOB Region

This is a region type plugin for Oracle Apex that outputs a CLOB to the page.

CLOBs are a nuisance in Apex, since it's can't really handle anything over 32 KB natively. Most likely, this would be some complicated bit of HTML that the out-of-the box Apex item types can't handle, or some formatted HTML you already have in a database.

## Installation 
1. In your Apex application go to Shared Components > Plug-ins > Import. Select the `clob_region_plugin.sql` file.
2. There is no step 2. You're done.

## Instructions:

1. Create a "Plug-ins" type region and select "CLOB Region" as the plugin type.
2. Continue creating your region as normal. In the Display Attributes section, if you select a region template of "No Template" (or similar, depending on your Apex theme), the region will not get borders or a title.
3. For the Source section, the easiest way is to specify a SQL query that selects your CLOB. It should return exactly one row and one column. An Apex collection works very well here.
4. It's likely that your CLOB contains HTML characters, in which case, edit your region and change "Escape Special Characters" to "No". *It is your responsibility to make sure all HTML entities like "&" are properly escaped.*
