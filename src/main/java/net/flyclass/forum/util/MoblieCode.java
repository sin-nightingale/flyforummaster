package net.flyclass.forum.util;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;


import javax.servlet.annotation.WebServlet;
import java.util.Scanner;



    public class MoblieCode {

        static final String product = "Dysmsapi";

        static final String domain = "dysmsapi.aliyuncs.com";

        static final String accessKeyId = "LTAI9dXfo9R1epde";
        static final String accessKeySecret = "gcIo9AWeDWrxdmFvPryTX2BIlbCA27";



        public static SendSmsResponse sendSms(String telephone, String code) throws ClientException {

            // 可自助调整超时时间
            System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
            System.setProperty("sun.net.client.defaultReadTimeout", "10000");

            // 初始化acsClient,暂不支持region化
            IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
            DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
            IAcsClient acsClient = new DefaultAcsClient(profile);

            // 组装请求对象-具体描述见控制台-文档部分内容
            SendSmsRequest request = new SendSmsRequest();
            // 必填:待发送手机号
            request.setPhoneNumbers(telephone);
            // 必填:短信签名-可在短信控制台中找到
            request.setSignName("3c课堂"); // TODO
            // 必填:短信模板-可在短信控制台中找到
            request.setTemplateCode("SMS_216835840");  // TODO
            // 可选:模板中的变量替换JSON串,如模板内容为"亲爱的用户,您的验证码为${code}"时,此处的值为
            request.setTemplateParam("{\"code\":\"" + code + "\"}");

            // 选填-上行短信扩展码(无特殊需求用户请忽略此字段)
            // request.setSmsUpExtendCode("90997");

            // 可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
            request.setOutId("yourOutId");

            // hint 此处可能会抛出异常，注意catch
            SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
            if(sendSmsResponse.getCode()!= null && sendSmsResponse.getCode().equals("OK")){
                System.out.println("短信发送成功！");
            }else {
                System.out.println("短信发送失败！");
            }
            return sendSmsResponse;
        }

        //以下为测试代码，随机生成验证码
        private static int newcode;
        public static int getNewcode() {
            return newcode;
        }
        public static void setNewcode(){
            newcode = (int)(Math.random()*8999)+1000;  //每次调用生成一次四位数的随机数
        }








//        public static void main(String[] args) throws Exception {
//            setNewcode();
//            String code = Integer.toString(getNewcode());
//            SendSmsResponse sendSms =sendSms("18506937494",code);//填写你需要测试的手机号码
//            System.out.println("短信接口返回的数据----------------");
//            System.out.println("Code=" + sendSms.getCode());
//            System.out.println("Message=" + sendSms.getMessage());
//            System.out.println("RequestId=" + sendSms.getRequestId());
//            System.out.println("BizId=" + sendSms.getBizId());
//            Scanner in=new Scanner(System.in);
//            System.out.println("请输入您收到的短信验证码：");
//            String codeis=in.next();
//
//            if (codeis.equals(code)){
//                System.out.println("短信验证码输入正确");
//            }else{
//                System.out.println("短信验证码输入错误");
//            }
//
//
//        }




    }


