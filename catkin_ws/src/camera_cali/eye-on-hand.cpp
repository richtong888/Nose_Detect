#include <opencv2/opencv.hpp>
#include <iostream>
#include <math.h>
#include <vector>

using namespace std;
using namespace cv;

Mat R_T2HomogeneousMatrix(const Mat& R, const Mat& T);
Mat eulerAngleToRotateMatrix(const Mat& eulerAngle, const std::string& seq);
Mat quaternionToRotatedMatrix(const Vec4d& q);
Mat attitudeVectorToMatrix(const Mat& m, bool useQuaternion, const string& seq);
void HomogeneousMtr2RT(Mat& HomoMtr, Mat& R, Mat& T);
bool isRotatedMatrix(Mat& R);

// if you want to make this code,use the below command
//  $ make eye-on-hand-testcode_unwork

//Poses of Checkboard in camera (Tchk2cam)，x,y,z，rx,ry,rz,



//target2camera is right !


// Mat_<double> CalPose = (cv::Mat_<double>(17, 6) <<

//     0.0231,    0.0427  ,  0.1878, -171.8329   ,12.4278,  134.8586,
//     0.0588 ,   0.0042    ,0.1746 ,-173.4553  , 17.5445 , 130.9804,
//     0.0296  ,  0.0095   , 0.1798, -176.7542   ,12.6807  ,133.6410,
//     0.0023   ,-0.0196  ,  0.1698 , 175.4545  ,  6.8264,  135.2367,
//     0.0277,    0.0246 ,   0.1840, -171.7749 ,  14.6030 , 123.8066,
//    -0.0020 ,   0.0362,    0.1870 ,-171.1564,   11.2391  ,104.1214, 


//     0.0467  ,  0.0200    ,0.1961, -173.2310  , 15.9622,  133.4656,

//     0.0551   , 0.0113   , 0.2279 ,-175.5102   ,15.0907 , 135.0700,

//     0.0610,   -0.0066  ,  0.2756, -178.9116  , 13.1007  ,137.5376,

//     0.0418 ,   0.0278 ,   0.1857 ,-169.5118 ,  21.0401,  124.5848,

//     0.0681  ,  0.0403,    0.2087 ,-155.8846,   30.6224 , 103.3171,

// // 21

//     0.0405,    0.0158  ,  0.1844, -172.2871  , 12.4023,  132.7367,

//     0.0470 ,   0.0084 ,   0.2052 ,-171.1618    ,4.7886 , 132.4613,

//     0.0708  ,  0.0152   , 0.2456, -166.1465   , 2.8180  ,133.2248,

//     0.0900   , 0.0227  ,  0.2684 ,-162.9403  ,  4.0775,  133.9805,

//     0.0349    ,0.0165 ,   0.1718, -177.6266 ,  10.9913 , 136.7732,

//    -0.0042,    0.0287,    0.1516 , 170.3909,   -3.8485  ,139.4591


// );

// //selected point 

// Mat_<double> CalPose = (cv::Mat_<double>(11, 6) <<

//     0.0588 ,   0.0042    ,0.1746 ,-173.4553  , 17.5445 , 130.9804,
//     0.0296  ,  0.0095   , 0.1798, -176.7542   ,12.6807  ,133.6410,

//     0.0277,    0.0246 ,   0.1840, -171.7749 ,  14.6030 , 123.8066,


//     0.0467  ,  0.0200    ,0.1961, -173.2310  , 15.9622,  133.4656,

//     0.0551   , 0.0113   , 0.2279 ,-175.5102   ,15.0907 , 135.0700,

//     0.0610,   -0.0066  ,  0.2756, -178.9116  , 13.1007  ,137.5376,

//     0.0418 ,   0.0278 ,   0.1857 ,-169.5118 ,  21.0401,  124.5848,

//     0.0681  ,  0.0403,    0.2087 ,-155.8846,   30.6224 , 103.3171,

// // 21

//     0.0405,    0.0158  ,  0.1844, -172.2871  , 12.4023,  132.7367,

//     0.0470 ,   0.0084 ,   0.2052 ,-171.1618    ,4.7886 , 132.4613,

//     0.0349    ,0.0165 ,   0.1718, -177.6266 ,  10.9913 , 136.7732




// );

// Mat_<double> CalPose_val = (cv::Mat_<double>(1, 6) <<
// //15
//     0.0599 ,  -0.0004  ,  0.2603 ,-177.9788 ,  14.0253  ,136.7579   
// );	

// //------------------------------------------------------------// 0725
// Mat_<double> CalPose = (cv::Mat_<double>(11, 6) <<

//     0.2131,   -0.0781   , 0.8400,  160.4639 ,  -43.5067,  143.1607,

//    -0.2522 ,  -0.1351  ,  0.7809 ,-165.5606,  -51.3261  ,  29.8758,

//   // -0.2940  , -0.0792    ,0.7401,  162.3140  , -21.0412 ,119.9644,

//     0.0037   , 0.1245   , 0.9079 , 161.8703 ,-19.8365 ,   14.2337,

//     0.1301    ,0.0949  ,  0.6307, -175.7539,   -32.7649 ,  77.4173,

//     0.1256,    0.1832 ,   0.6639 ,-177.9517   ,-0.0754 , 77.3418,

//    -0.3092 ,   0.0571,    0.6789,  154.8004  ,  -2.0689, -175.4994,

//     0.1277  ,  0.2463    ,0.8422 ,-158.2967 ,  -20.0831 , 139.5984,

//     0.1866   ,-0.1699   , 0.4338, -135.8859,  -10.8322  , -8.6111,

//     0.1613,   -0.0126  ,  0.6530 , 168.6085  , -4.0139 ,-101.4777,

//     0.1180 ,   0.1271 ,   0.5911  ,162.4551 ,   -2.1135 ,-28.4092,

//     0.0711  ,  0.0150,    0.4690, -176.2259,  -32.4983   ,47.4482
// );


// Mat_<double> CalPose_val = (cv::Mat_<double>(1, 6) <<
//     0.0523,    0.0128 ,   0.1816 , 162.1553  , -7.4340 ,-137.8286
// );	

// //-----------------------------------------------------------//

//------------------------------------------------------------// 0913_default
Mat_<double> CalPose = (cv::Mat_<double>(12, 6) <<

    0.2787,   -0.0126   , 0.8805,  162.8926 , -42.4020,  156.6426,

   -0.1577,   -0.2175  ,  0.8240 ,-167.5852,  -47.7229 ,  46.6924,

   -0.2071 ,  -0.1561    ,0.7775  ,163.8602  ,-21.8021  ,135.0837,

    0.0122  ,  0.1098   , 0.9605,  160.4636 , -17.2323,   29.8394,

    0.1530   , 0.1106  ,  0.6641 ,-175.4757,  -31.3259 ,  92.6412,

    0.1246    ,0.1987 ,   0.7021, -176.6342   ,-0.6637  , 92.6290,

   -0.2709,   -0.0285,    0.7163 , 154.1062  , -2.2821, -160.3771,

    0.1048 ,   0.2846    ,0.8831, -156.1735 , -17.9907 , 155.1581,

    0.2680  , -0.1481   , 0.4711 ,-139.8179,  -10.3338  ,  7.7158,

    0.1854   , 0.0243  ,  0.6952  ,166.9227  , -4.4355,  -86.1530,

    0.1131 ,   0.1317 ,   0.6329,  159.6117 ,  -1.0665 , -13.0639,

    0.1125  ,  0.0053,    0.5015 ,-176.7086,  -30.8870  , 63.2277
);


Mat_<double> CalPose_val = (cv::Mat_<double>(1, 6) <<
    0.0523,    0.0128 ,   0.1816 , 162.1553  , -7.4340 ,-137.8286
);	

// //-----------------------------------------------------------//


//------------------------------------------------------------// 0913_calibrated
// Mat_<double> CalPose = (cv::Mat_<double>(12, 6) <<
//     0.2753,    0.0506  ,  0.8671,  168.6085  ,-38.8887,  153.7948,

//    -0.1623 ,  -0.1609 ,   0.8070 ,-174.0527,  -43.6629 ,  50.0072,

//    -0.2077  , -0.1001    ,0.7472  ,169.0340  ,-20.6866  ,133.6963,

//     0.0067   , 0.1799   , 0.9411,  156.6263 , -15.4034   ,30.9964,

//     0.1487    ,0.1588  ,  0.6478 ,-176.6437,  -27.5471,   93.3956,

//     0.1200,    0.2503 ,   0.6840, -177.7736   , 0.8109 ,  92.8006,

//    -0.2698 ,   0.0222,    0.6890 , 156.6530  , -4.5081, -160.6775,

//     0.1004  ,  0.3529    ,0.8682, -152.5349 , -14.7030 , 154.8771,

//     0.2612   ,-0.1140   , 0.4549 ,-144.1458,  -11.9168  ,  8.0093,

//     0.1808 ,   0.0744  ,  0.6788  ,168.6706  , -3.1496 , -86.9180,

//     0.1103  ,  0.1802 ,   0.6251,  158.1244 ,   0.2800  ,-13.7307,

//     0.1085   , 0.0406,    0.4851 ,-179.8636,  -28.1315   ,64.9066
// );


// Mat_<double> CalPose_val = (cv::Mat_<double>(1, 6) <<
//     0.0523,    0.0128 ,   0.1816 , 162.1553  , -7.4340 ,-137.8286
// );	

//-----------------------------------------------------------//





// Mat_<double> CalPose = (cv::Mat_<double>(10, 6) <<
// 	-0.072944147641399, -0.06687830562048944, 0.4340418493881254, -0.2207496117519063, 0.0256862005614321, 0.1926014162476009,
// 	-0.01969337858360518, -0.05095294728651902, 0.3671266719105768, 0.1552099329677287, -0.5763323472739464, 0.09956130526058841,
// 	0.1358164536530692, -0.1110802522656379, 0.4001396735998251, -0.04486168331242635, -0.004268942058870162, 0.05290073845562016,
// 	0.1360676260120161, -0.002373036366121294, 0.3951670952829301, -0.4359637938379769, 0.00807193982932386, 0.06162504121755787,
// 	-0.1047666520352697, -0.01377729010376614, 0.4570029374109721, -0.612072103513551, -0.04939465180949879, -0.1075464055169537,
// 	0.02866460103085085, -0.1043911269729344, 0.3879127305077527, 0.3137563103168434, -0.02113958397023016, 0.1311397970432597,
// 	0.1122741829392126, 0.001044006395747612, 0.3686697279333643, 0.1607160803445018, 0.2468677059920437, 0.1035103912091547,
// 	-0.06079521129779342, -0.02815190820828123, 0.4451740202390909, 0.1280935541917056, -0.2674407142401368, 0.1633865613363686,
// 	-0.02475533256363622, -0.06950841248698086, 0.2939836207787282, 0.1260629671933584, -0.2637748974005461, 0.1634102148863728,
// 	0.1128618887222624, 0.00117877722121125, 0.3362496409334229, 0.1049541359309871, -0.2754352318773509, 0.4251492928748009,
// 	0.1510545750008333, -0.0725019944548204, 0.3369908269102371, 0.2615745097093249, -0.1295598776133405, 0.6974394284203849,
// 	0.04885313290076512, -0.06488755216394324, 0.2441532410787161, 0.1998243391807502, -0.04919417529483511, -0.05133193756053007,
// 	0.08816140480523708, -0.05549965109057759, 0.3164905645998022, 0.164693654482863, 0.1153894876338608, 0.01455551646362294);

// Mat_<double> CalPose_val = (cv::Mat_<double>(1, 6) <<
// 	0.08816140480523708, -0.05549965109057759, 0.3164905645998022, 0.164693654482863, 0.1153894876338608, 0.01455551646362294);



///////////////////////////////////////////////////////////////////////////////////

//Poses of end effector (Tend2base),x,y,z,rx,ry,rz

// Mat_<double> ToolPose = (cv::Mat_<double>(17, 6) <<

//    -0.0066,    0.4776 ,   0.1553, -176.3305 ,   2.4354,   55.7721,
//    -0.0210 ,   0.4785,    0.1576 ,-168.4258,    8.0889 ,  52.9638,
//    -0.0144  ,  0.4732   , 0.1563, -173.8823   , 7.9089  , 54.5500,
//    -0.0148   , 0.4630  ,  0.1575 ,-177.5158  , 13.6744   ,54.9913 ,  
//    -0.0141,    0.4780 ,   0.1562, -173.1462 ,   6.4417,   45.3068,
//    -0.0141 ,   0.4780,    0.1562 ,-175.7200,    8.3716 ,  25.5392,


//    -0.0144,    0.4805    ,0.1718, -172.3170   , 5.7182,   54.7358,

//    -0.0148 ,   0.4836   , 0.2067 ,-172.5632   , 6.5912 ,  55.8648,

//    -0.0150  ,  0.4816  ,  0.2578, -173.0729  ,  7.7513  , 57.5219,

//     0.0143,    0.4793 ,   0.1587 ,-166.3003 ,   9.6920   ,47.6447,

//     0.0798 ,   0.4782,    0.1688, -153.3328,   19.8876   ,34.7518,

// 	//21

//    -0.0443  ,  0.4756 ,   0.1552, -177.3320  ,  2.3056,   53.3658,

//   -0.1101,    0.4653 ,   0.1562  ,174.5246  , -7.6439  , 52.4422,

//    -0.1756,    0.4478   , 0.1615,  171.4436,  -20.6680  , 52.4914,

//    -0.2054 ,   0.4371  ,  0.1652 , 171.9875  ,-27.0785   ,52.4028,

//    -0.0242  ,  0.4874 ,   0.1490 ,-177.1379 ,   7.5343,   57.0688,

//    -0.0149   , 0.5087,    0.1329  ,171.7627,   12.5814 ,  58.0596   


// );

//selected 
// Mat_<double> ToolPose = (cv::Mat_<double>(11, 6) <<


//    -0.0210 ,   0.4785,    0.1576 ,-168.4258,    8.0889 ,  52.9638,
//    -0.0144  ,  0.4732   , 0.1563, -173.8823   , 7.9089  , 54.5500,
 
//    -0.0141,    0.4780 ,   0.1562, -173.1462 ,   6.4417,   45.3068,


//    -0.0144,    0.4805    ,0.1718, -172.3170   , 5.7182,   54.7358,

//    -0.0148 ,   0.4836   , 0.2067 ,-172.5632   , 6.5912 ,  55.8648,

//    -0.0150  ,  0.4816  ,  0.2578, -173.0729  ,  7.7513  , 57.5219,

//     0.0143,    0.4793 ,   0.1587 ,-166.3003 ,   9.6920   ,47.6447,

//     0.0798 ,   0.4782,    0.1688, -153.3328,   19.8876   ,34.7518,

// 	//21

//    -0.0443  ,  0.4756 ,   0.1552, -177.3320  ,  2.3056,   53.3658,

//   -0.1101,    0.4653 ,   0.1562  ,174.5246  , -7.6439  , 52.4422,

//    -0.0242  ,  0.4874 ,   0.1490 ,-177.1379 ,   7.5343,   57.0688



// );

// Mat_<double> ToolPose_val = (cv::Mat_<double>(1, 6) <<
//    -0.0150 ,   0.4831 ,   0.2419, -172.8936  ,  7.4023 ,  57.0043
//  );	  

// 0725

Mat_<double> ToolPose = (cv::Mat_<double>(12, 6) <<

   -0.1598,    0.3826 ,   0.3270,  130.8934 , -20.7048,  142.2077,

    0.1732 ,   0.3749,    0.3151 ,-146.3099,  -25.6589 ,  43.8979,

    0.1978  ,  0.3742    ,0.1776  ,117.9172  ,-46.1301  ,140.2500,

   -0.2159   , 0.3218   , 0.1840, -106.1021 , -25.6589 , -11.3099,

    0.0000    ,0.6129  ,  0.2912 , 180.0000,  -60.0000  , 90.0000,

    0.0000,    0.4901 ,   0.0217  ,180.0000  ,-90.0000,   90.0000,

   -0.2284 ,   0.5432,    0.2804,   86.3849 ,  13.6440 , 150.4445,

    0.2159  ,  0.3218    ,0.1840 , 106.1021,  -25.6589, -168.6901,

    0.1720   , 0.6884   , 0.1970  ,-98.6822   ,-4.9809 ,  40.3783,

    0.0851    ,0.4827  ,  0.0217, -115.7305  , 90.0000  ,-35.7305,

   -0.0630,    0.5728 ,  -0.0117 , -88.7675 ,  16.6658,  -15.3112,

    0.0000 ,   0.7374,    0.1667 ,-139.1066,  -48.5904 ,  40.8934

);

Mat_<double> ToolPose_val = (cv::Mat_<double>(1, 6) <<
    -0.0210 ,   0.4785,    0.1576 ,-168.4258,    8.0889 ,  52.9638
 );	  
 


// Mat_<double> ToolPose = (cv::Mat_<double>(10, 6) <<
// 	-0.3969707, -0.460018, 0.3899877, 90.2261, -168.2015, 89.7748,
// 	-0.1870185, -0.6207147, 0.2851157, 57.2636, -190.2034, 80.7958,
// 	-0.1569776, -0.510021, 0.3899923, 90.225, -178.2038, 81.7772,
// 	-0.1569787, -0.5100215, 0.3299975, 90.2252, -156.205, 81.7762,
// 	-0.3369613, -0.4100348, 0.3299969, 90.2264, -146.2071, 71.778,
// 	-0.2869552, -0.6100449, 0.4299998, 90.2271, -199.2048, 86.7806,
// 	-0.2869478, -0.6600489, 0.4299948, 105.2274, -189.2053, 86.7814,
// 	-0.286938, -0.6300559, 0.4299997, 75.2279, -189.2056, 86.783,
// 	-0.2869343, -0.5700635, 0.2800084, 75.2291, -189.2055, 86.7835,
// 	-0.1669241, -0.5700796, 0.280015, 75.2292, -189.205, 101.7845,
// 	-0.236909, -0.4700997, 0.3600046, 87.2295, -196.2063, 118.7868,
// 	-0.2369118, -0.6201035, 0.2600001, 87.2297, -192.2087, 75.7896,
// 	-0.2468983, -0.620112, 0.359992, 97.2299, -190.2082, 80.7908);
		

// Mat_<double> ToolPose_val = (cv::Mat_<double>(1, 6) <<
// 	-0.2468983, -0.620112, 0.359992, 97.2299, -190.2082, 80.7908);



int main(int argc, char** argv)
{
	//数据声明
	vector<Mat> R_gripper2base;
	vector<Mat> T_gripper2base;
	vector<Mat> R_target2cam;
	vector<Mat> T_target2cam;
	Mat R_cam2gripper = Mat(3,3,CV_64FC1);				//相机与机械臂末端坐标系的旋转矩阵与平移矩阵
	Mat T_cam2gripper = Mat(3,1,CV_64FC1);
	Mat Homo_cam2gripper = Mat(4,4,CV_64FC1);

	vector<Mat> Homo_target2cam;
	vector<Mat> Homo_gripper2base;
	vector<Mat> Homo_target2cam_val;
	vector<Mat> Homo_gripper2base_val;	
	Mat tempR, tempT, temp;

	double thred = 0.0000000001; //10e-10

	for (int i = 0; i < CalPose.rows; i++)				//计算标定板与相机间的齐次矩阵（旋转矩阵与平移向量）
	{		
		temp = attitudeVectorToMatrix(CalPose.row(i), false, "xyz");	//注意seq为空，相机与标定板间的为旋转向量
		Homo_target2cam.push_back(temp);
		HomogeneousMtr2RT(temp, tempR, tempT);

		// for (int k = 0; k<= 2 ;k++)
		// {

		// 	if (tempR.at<double>(k,0) < thred && tempR.at<double>(k,0) > -thred)
		// 		tempR.at<double>(k,0) = 0;
		// 	if (tempR.at<double>(k,1) < thred && tempR.at<double>(k,1) > -thred)
		// 		tempR.at<double>(k,1) = 0;
		// 	if (tempR.at<double>(k,2) < thred && tempR.at<double>(k,2) > -thred)
		// 		tempR.at<double>(k,2) = 0;
				

		// 	if (tempT.at<double>(0,k) < thred && tempT.at<double>(0,k) > -thred)
		// 		tempT.at<double>(0,k) = 0;		

		// }
		
		/*cout << i << "::" << temp << endl;
		cout << i << "::" << tempR << endl;
		cout << i << "::" << tempT << endl;*/
 		R_target2cam.push_back(tempR);
		T_target2cam.push_back(tempT);
	}
	for (int j = 0; j < ToolPose.rows; j++)				//计算机械臂末端坐标系与机器人基坐标系之间的齐次矩阵
	{
		temp = attitudeVectorToMatrix(ToolPose.row(j), false, "xyz");  //注意seq不是空，机械臂末端坐标系与机器人基坐标系之间的为欧拉角
		Homo_gripper2base.push_back(temp);
		HomogeneousMtr2RT(temp, tempR,tempT);
		/*cout << j << "::" << temp << endl;
		cout << j << "::" << tempR << endl;
		cout << j << "::" << tempT << endl;*/

		// for (int k = 0; k<= 2 ;k++)
		// {

		// 	if (tempR.at<double>(k,0) < thred && tempR.at<double>(k,0) > -thred)
		// 		tempR.at<double>(k,0) = 0;
		// 	if (tempR.at<double>(k,1) < thred && tempR.at<double>(k,1) > -thred)
		// 		tempR.at<double>(k,1) = 0;
		// 	if (tempR.at<double>(k,2) < thred && tempR.at<double>(k,2) > -thred)
		// 		tempR.at<double>(k,2) = 0;
				

		// 	if (tempT.at<double>(0,k) < thred && tempT.at<double>(0,k) > -thred)
		// 		tempT.at<double>(0,k) = 0;		

		// }

		R_gripper2base.push_back(tempR);
		T_gripper2base.push_back(tempT);
	}

	//Validate 
	for (int j = 0; j < ToolPose_val.rows; j++)	
	{
		temp = attitudeVectorToMatrix(ToolPose_val.row(j), false, "xyz");  //注意seq不是空，机械臂末端坐标系与机器人基坐标系之间的为欧拉角
		Homo_gripper2base_val.push_back(temp);
	}

	for (int i = 0; i < CalPose_val.rows; i++)
	{
		temp = attitudeVectorToMatrix(CalPose_val.row(i), false, "xyz");  //注意seq不是空，机械臂末端坐标系与机器人基坐标系之间的为欧拉角
		Homo_target2cam_val.push_back(temp);
	}


	//TSAI计算速度最快
	// cout << R_gripper2base[0].at<double>(0,0) << endl;

	cout << "R_gripper2base[0]" << endl << R_gripper2base[0] << endl << endl;



	// calibrateHandEye(R_gripper2base,T_gripper2base,R_target2cam,T_target2cam,R_cam2gripper,T_cam2gripper,CALIB_HAND_EYE_TSAI);
	calibrateHandEye(R_gripper2base,T_gripper2base,R_target2cam,T_target2cam,R_cam2gripper,T_cam2gripper,CALIB_HAND_EYE_TSAI);


	Homo_cam2gripper = R_T2HomogeneousMatrix(R_cam2gripper, T_cam2gripper);

	cout << "Homo_cam2gripper ( including rotation MATRIX or not)  " << isRotatedMatrix(Homo_cam2gripper) << endl ;
	cout <<Homo_cam2gripper << endl << endl;
	cout << Homo_gripper2base[0] << endl << endl;
///////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	/**************************************************
	* @note   手眼系统精度测试，原理是标定板在机器人基坐标系中位姿固定不变，
	*		  可以根据这一点进行演算
	**************************************************/
	//使用1,2组数据验证  标定板在机器人基坐标系中位姿固定不变
	// cout << "0 : " << (Homo_gripper2base[0] * Homo_cam2gripper * Homo_target2cam[0]).inv() << endl;
	// cout << "1 : " << (Homo_gripper2base[1] * Homo_cam2gripper * Homo_target2cam[1]).inv() << endl;
	// cout << "2 : " << (Homo_gripper2base[2] * Homo_cam2gripper * Homo_target2cam[2]).inv() << endl;	
	// cout << "3 : " << (Homo_gripper2base[3] * Homo_cam2gripper * Homo_target2cam[3]).inv() << endl;

	cout << "0 : " << Homo_gripper2base[0] * Homo_cam2gripper * Homo_target2cam[0] << endl;
	cout << "1 : " << Homo_gripper2base[1] * Homo_cam2gripper * Homo_target2cam[1] << endl;
	cout << "2 : " << Homo_gripper2base[2] * Homo_cam2gripper * Homo_target2cam[2] << endl;	
	cout << "3 : " << Homo_gripper2base[3] * Homo_cam2gripper * Homo_target2cam[3] << endl;
	cout << "val : " <<  Homo_gripper2base_val[0] * Homo_cam2gripper *Homo_target2cam_val[0]  << endl <<endl;		

	// cout <<" g2b " << Homo_gripper2base[0] << endl;
	// cout <<" c2g " << Homo_cam2gripper << endl;	
	// cout <<" t2c " << Homo_target2cam[0] << endl;
	// cout << "c2b" << Homo_gripper2base[0] * Homo_cam2gripper  << endl << endl;


	// cout << "base2cam : " << (Homo_cam2gripper * Homo_gripper2base[0]).inv() << endl;

	//标定板在相机中的位姿
	// cout << " Homo_target2cam[1] : " << Homo_target2cam[1] << endl;
	// cout << "4 : " << Homo_cam2gripper.inv() * Homo_gripper2base[1].inv() * Homo_gripper2base[0] * Homo_cam2gripper * Homo_target2cam[0] << endl;

	// cout << "----Hand-eye-system testing-----" << endl;
	cout << "checkboard behind robot arm" << endl;
	for (int i = 0; i < Homo_target2cam.size(); i++)
	{
		Mat chessPos{ 0.0,0.0,0.0,1.0 };  //4*1矩阵，单独求机械臂坐标系下，标定板XYZ
		Mat worldPos = Homo_gripper2base[i] * Homo_cam2gripper * Homo_target2cam[i] * chessPos;
		cout << i << ": " << worldPos.t() << endl;
	}
	
	waitKey(0);

	return 0;
}

/**************************************************
* @brief   将旋转矩阵与平移向量合成为齐次矩阵
* @note     
* @param   Mat& R   3*3旋转矩阵
* @param   Mat& T   3*1平移矩阵
* @return  Mat      4*4齐次矩阵
**************************************************/
Mat R_T2HomogeneousMatrix(const Mat& R,const Mat& T)
{
	Mat HomoMtr;
	Mat_<double> R1 = (Mat_<double>(4, 3) << 
										R.at<double>(0, 0), R.at<double>(0, 1), R.at<double>(0, 2),
										R.at<double>(1, 0), R.at<double>(1, 1), R.at<double>(1, 2),
										R.at<double>(2, 0), R.at<double>(2, 1), R.at<double>(2, 2),
										0, 0, 0);
	Mat_<double> T1 = (Mat_<double>(4, 1) <<
										T.at<double>(0,0),
										T.at<double>(1,0),
										T.at<double>(2,0),
										1);
	cv::hconcat(R1, T1, HomoMtr);		//矩阵拼接
	return HomoMtr;
}

/**************************************************
* @brief    齐次矩阵分解为旋转矩阵与平移矩阵
* @note
* @param	const Mat& HomoMtr  4*4齐次矩阵
* @param	Mat& R              输出旋转矩阵
* @param	Mat& T				输出平移矩阵
* @return
**************************************************/
void HomogeneousMtr2RT(Mat& HomoMtr, Mat& R, Mat& T)
{
	//Mat R_HomoMtr = HomoMtr(Rect(0, 0, 3, 3)); //注意Rect取值
	//Mat T_HomoMtr = HomoMtr(Rect(3, 0, 1, 3));
	//R_HomoMtr.copyTo(R);
	//T_HomoMtr.copyTo(T);
	/*HomoMtr(Rect(0, 0, 3, 3)).copyTo(R);
	HomoMtr(Rect(3, 0, 1, 3)).copyTo(T);*/
	Rect R_rect(0, 0, 3, 3);
	Rect T_rect(3, 0, 1, 3);
	R = HomoMtr(R_rect);
	T = HomoMtr(T_rect);

}

/**************************************************
* @brief	检查是否是旋转矩阵
* @note
* @param
* @param
* @param
* @return  true : 是旋转矩阵， false : 不是旋转矩阵
**************************************************/
bool isRotatedMatrix(Mat& R)		//旋转矩阵的转置矩阵是它的逆矩阵，逆矩阵 * 矩阵 = 单位矩阵
{
	Mat temp33 = R({ 0,0,3,3 });	//无论输入是几阶矩阵，均提取它的三阶矩阵
	Mat Rt;
	transpose(temp33, Rt);  //转置矩阵
	Mat shouldBeIdentity = Rt * temp33;//是旋转矩阵则乘积为单位矩阵
	Mat I = Mat::eye(3, 3, shouldBeIdentity.type());

	return cv::norm(I, shouldBeIdentity) < 1e-6;
}

/**************************************************
* @brief   欧拉角转换为旋转矩阵
* @note		
* @param    const std::string& seq  指定欧拉角的排列顺序；（机械臂的位姿类型有xyz,zyx,zyz几种，需要区分）
* @param    const Mat& eulerAngle   欧拉角（1*3矩阵）, 角度值
* @param
* @return   返回3*3旋转矩阵
**************************************************/
Mat eulerAngleToRotateMatrix(const Mat& eulerAngle, const std::string& seq)
{
	CV_Assert(eulerAngle.rows == 1 && eulerAngle.cols == 3);//检查参数是否正确

	eulerAngle /= (180 / CV_PI);		//度转弧度

	Matx13d m(eulerAngle);				//<double, 1, 3>

	auto rx = m(0, 0), ry = m(0, 1), rz = m(0, 2);
	auto rxs = sin(rx), rxc = cos(rx);
	auto rys = sin(ry), ryc = cos(ry);
	auto rzs = sin(rz), rzc = cos(rz);

	//XYZ方向的旋转矩阵
	Mat RotX = (Mat_<double>(3, 3) << 1, 0, 0,
		0, rxc, -rxs,
		0, rxs, rxc);
	Mat RotY = (Mat_<double>(3, 3) << ryc, 0, rys,
		0,	  1, 0,
		-rys, 0, ryc);
	Mat RotZ = (Mat_<double>(3, 3) << rzc, -rzs, 0,
		rzs, rzc, 0,
		0, 0, 1);
	//按顺序合成后的旋转矩阵
	cv::Mat rotMat;

	if (seq == "zyx") rotMat = RotX * RotY * RotZ;
	else if (seq == "yzx") rotMat = RotX * RotZ * RotY;
	else if (seq == "zxy") rotMat = RotY * RotX * RotZ;
	else if (seq == "yxz") rotMat = RotZ * RotX * RotY;
	else if (seq == "xyz") rotMat = RotZ * RotY * RotX;
	else if (seq == "xzy") rotMat = RotY * RotZ * RotX;
	else
	{
		cout << "Euler Angle Sequence string is wrong...";
	}
	if (!isRotatedMatrix(rotMat))		//欧拉角特殊情况下会出现死锁
	{
		cout << "Euler Angle convert to RotatedMatrix failed..." << endl;
		exit(-1);
	}
	return rotMat;
}

/**************************************************
* @brief   将四元数转换为旋转矩阵
* @note
* @param   const Vec4d& q   归一化的四元数: q = q0 + q1 * i + q2 * j + q3 * k;
* @return  返回3*3旋转矩阵R
**************************************************/
Mat quaternionToRotatedMatrix(const Vec4d& q)
{
	double q0 = q[0], q1 = q[1], q2 = q[2], q3 = q[3];

	double q0q0 = q0 * q0 , q1q1 = q1 * q1 , q2q2 = q2 * q2, q3q3 = q3 * q3;
	double q0q1 = q0 * q1 , q0q2 = q0 * q2 , q0q3 = q0 * q3;
	double q1q2 = q1 * q2, q1q3 = q1 * q3;
	double q2q3 = q2 * q3;
	//根据公式得来
	Mat RotMtr = (Mat_<double>(3, 3) << (q0q0 + q1q1 - q2q2 - q3q3), 2 * (q1q2 + q0q3), 2 * (q1q3 - q0q2),
		2 * (q1q2 - q0q3), (q0q0 - q1q1 + q2q2 - q3q3), 2 * (q2q3 + q0q1),
		2 * (q1q3 + q0q2), 2 * (q2q3 - q0q1), (q0q0 - q1q1 - q2q2 + q3q3));
	//这种形式等价
	/*Mat RotMtr = (Mat_<double>(3, 3) << (1 - 2 * (q2q2 + q3q3)), 2 * (q1q2 - q0q3), 2 * (q1q3 + q0q2),
										 2 * (q1q2 + q0q3), 1 - 2 * (q1q1 + q3q3), 2 * (q2q3 - q0q1),
										 2 * (q1q3 - q0q2), 2 * (q2q3 + q0q1), (1 - 2 * (q1q1 + q2q2)));*/

	return RotMtr;
}

/**************************************************
* @brief      将采集的原始数据转换为齐次矩阵（从机器人控制器中获得的）
* @note
* @param	  Mat& m    1*6//1*10矩阵 ， 元素为： x,y,z,rx,ry,rz  or x,y,z, q0,q1,q2,q3,rx,ry,rz
* @param	  bool useQuaternion      原始数据是否使用四元数表示
* @param	  string& seq         原始数据使用欧拉角表示时，坐标系的旋转顺序
* @return	  返回转换完的齐次矩阵
**************************************************/
Mat attitudeVectorToMatrix(const Mat& m, bool useQuaternion, const string& seq)
{
	CV_Assert(m.total() == 6 || m.total() == 10 || m.total() == 7);
	//if (m.cols == 1)	//转置矩阵为行矩阵
	//	m = m.t();	

	Mat temp = Mat::eye(4, 4, CV_64FC1);

	if (useQuaternion)
	{
		Vec4d quaternionVec = m({ 3,0,4,1 });   //读取存储的四元数
		quaternionToRotatedMatrix(quaternionVec).copyTo(temp({0,0,3,3}));  
	}
	else
	{
		Mat rotVec;
		if (m.total() == 6)
		{
			rotVec = m({ 3,0,3,1 });   //读取存储的欧拉角
		}
		if (m.total() == 10)
		{
			rotVec = m({ 7,0,3,1 });
		}
		//如果seq为空，表示传入的是3*1旋转向量，否则，传入的是欧拉角
		if (0 == seq.compare(""))
		{
			Rodrigues(rotVec, temp({ 0,0,3,3 }));   //罗德利斯转换
		}
		else
		{
			eulerAngleToRotateMatrix(rotVec, seq).copyTo(temp({ 0,0,3,3 }));
		}
	}
	//存入平移矩阵
	temp({ 3,0,1,3 }) = m({ 0,0,3,1 }).t();
	return temp;   //返回转换结束的齐次矩阵
}

