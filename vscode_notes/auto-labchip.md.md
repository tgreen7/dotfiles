# auto-labchip.md



for asec and nano
samples shipped out digitally from ads
ads takes in qc data from caliber, reviewed in koala
(ads pulls from caliber database on a schedule, into own data base and enrich it, builds giant 'excel' document and sent to koala, if koala says it is approved it will send out that 'excel' file)

approve in koala gate marks data in caliber db as 'approved', then ads will pick it up on a schedule and bring it into own db

each oi could have 10 qc_results
ads building up db of all qc for the oi
insert into bucket, and excel document
aggregates all that data for the oi into an excel document
once all the qc is done for that oi, work order is complete
then there is a separate koala view for this ads data (one view for whole work order)
once they hit approve on that second gate it is approved to be sent to customer



want to skip maestro
asec instrument into s3
bfx pipeline will get triggered off this
dumps into another s3 path
bfx will send directly to caliber that s3 path



all the work for asec is done 

the manual flow is a backup



nanodsf look at charts coming out of machine and can adjust image live in koala
needs testing and might have some pushback for changes
no more development needed for nanodsf, might want to get it pushed to production
less risky than other things

if business wants to release it before sam gets back 
might want to release a week from next tuesday


labchip is run through maestro into caliber
they want to switch to bfx automatic
alex boulgakov will be writing this for labchip data for bfx
labchip qc type is spread across two qc types size and protein purity
only approve size qc type
ideal would be to switch to single qc type for all data since bfx will pass data once and we would need to split 