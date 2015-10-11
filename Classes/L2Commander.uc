
class L2Commander extends L2;

DefaultProperties
{
	TunicMesh=SkeletalMesh'CHR_RS_IJA.Mesh.ija_officer_tunic_raw'
	FieldgearMesh=SkeletalMesh'CHR_RS_SNLF.Mesh.snlf_gear_raw_commander'
	
	BodyMICTemplate=MaterialInstanceConstant'CHR_RS_BETASNLF.MIC.SNLF_Officer_Tunic_2'
	
	HeadgearMeshes(0)=SkeletalMesh'CHR_RS_BETASNLF.Mesh.cap_Commander'
	
	bHeadGearIsHelmet=false
	
	ArmsMeshesFP(0)=SkeletalMesh'CHR_1stP_Hands_Master_two.Mesh.1stP_Hands_SNLF_commander'
}
