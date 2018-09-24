//+------------------------------------------------------------------+
//|                                   Copyright 2018, Erlon F. Souza |
//|                                       https://github.com/erlonfs |
//+------------------------------------------------------------------+

#property copyright "Copyright 2018, Erlon F. Souza"
#property link      "https://github.com/erlonfs"
#property version    "1.0"

#include <Controls\Dialog.mqh>
#include <Controls\Button.mqh>
#include <Controls\Edit.mqh>
#include <Controls\Label.mqh>
#include <Controls\DatePicker.mqh>
#include <Controls\ListView.mqh>
#include <Controls\ComboBox.mqh>
#include <Controls\SpinEdit.mqh>
#include <Controls\RadioGroup.mqh>
#include <Controls\CheckGroup.mqh>

#include <BadRobot.Framework\Logger.mqh>
#include <BadRobot.Framework\BadRobotCore.mqh>

//--- indents and gaps
#define INDENT_LEFT                         (11)      // indent from left (with allowance for border width)
#define INDENT_TOP                          (11)      // indent from top (with allowance for border width)
#define INDENT_RIGHT                        (11)      // indent from right (with allowance for border width)
#define INDENT_BOTTOM                       (11)      // indent from bottom (with allowance for border width)
#define CONTROLS_GAP_X                      (5)       // gap by X coordinate
#define CONTROLS_GAP_Y                      (5)       // gap by Y coordinate
//--- for buttons
#define BUTTON_WIDTH                        (70)     // size by X coordinate
#define BUTTON_HEIGHT                       (30)      // size by Y coordinate
//--- for the indication area
#define EDIT_HEIGHT                         (20)      // size by Y coordinate
//--- for group controls
#define GROUP_WIDTH                         (150)     // size by X coordinate
#define LIST_HEIGHT                         (179)     // size by Y coordinate
#define RADIO_HEIGHT                        (56)      // size by Y coordinate
#define CHECK_HEIGHT                        (93)      // size by Y coordinate

#define PANEL_WIDTH                         (180)      // width of panel
#define PANEL_HEIGHT                        (270)      // height of panel
#define LABEL_FONT_SIZE                     (8)      // height of panel
#define CONTROLS_DISTANCE_Y                 (5)      // height of panel

class BadRobotUI  : public BadRobotCore
{
	private:
		
	CEdit             m_edit;                         
   CButton           btnComprar;                       
   CButton           btnVender; 
   CButton           btnZerar; 
   CButton           btnInverter; 
   CLabel				label1;
   CLabel				label2;
   CLabel				label3;
   CLabel				label4;
   CLabel				label5;
   CLabel				label6;
   CLabel				label7;
   CLabel				label8;
   CLabel				label9;  

   CButton           m_button3;                       // the fixed button object
   CSpinEdit         m_spin_edit;                     // the up-down object
   CDatePicker       m_date;                          // the datepicker object
   CListView         m_list_view;                     // the list object
   CComboBox         m_combo_box;                     // the dropdown list object
   CRadioGroup       m_radio_group;                   // the radio buttons group object
   CCheckGroup       m_check_group;                   // the check box group object
	   
	bool CreateLabel1(void) 
   { 
      int x1=INDENT_LEFT;
      int y1= CONTROLS_GAP_Y;
      int x2=INDENT_LEFT + 50;
      int y2=y1;
     
      if(!label1.Create(m_chart_id,m_name+"Label1",m_subwin,x1,y1,x2,y2)) return(false); 
      
      label1.FontSize(8);
      label1.Font("Tahoma");
      label1.Text("POSIÇÃO 0");
      
      
      if(!Add(label1)) return(false); 
      
      

      return(true); 
   }
   
	bool CreateLabel2(void) 
   { 
      int x1=INDENT_LEFT;
      int y1= CONTROLS_GAP_Y * 3 + CONTROLS_DISTANCE_Y;
      int x2=x1 + INDENT_LEFT + 50;
      int y2=y1;
     
      if(!label2.Create(m_chart_id,m_name+"Label2",m_subwin,x1,y1,x2,y2)) return(false); 
      
      label2.FontSize(8);
      label2.Font("Tahoma");
      label2.Text("SL 0 TP 0");      
      
      if(!Add(label2)) return(false); 
            
      return(true); 
   }  
   
	bool CreateLabel3(void) 
   { 
      int x1=INDENT_LEFT;
      int y1= CONTROLS_GAP_Y * 6 + CONTROLS_DISTANCE_Y;
      int x2=x1 + INDENT_LEFT + 50;
      int y2=y1;
     
      if(!label3.Create(m_chart_id,m_name+"Label3",m_subwin,x1,y1,x2,y2)) return(false); 
      
      label3.FontSize(8);
      label3.Font("Tahoma");
      label3.Text("1ª PARC " + (IsParcial() ? DoubleToString(0, _Digits) + " VOL 0" : "DESAT."));      
      
      if(!Add(label3)) return(false); 
            
      return(true); 
   } 
   
	bool CreateLabel4(void) 
   { 
      int x1=INDENT_LEFT;
      int y1= CONTROLS_GAP_Y * 9 + CONTROLS_DISTANCE_Y;
      int x2=x1 + INDENT_LEFT + 50;
      int y2=y1;
     
      if(!label4.Create(m_chart_id,m_name+"Label4",m_subwin,x1,y1,x2,y2)) return(false); 
      
      label4.FontSize(8);
      label4.Font("Tahoma");
      label4.Text("2ª PARC " + (IsParcial() ? DoubleToString(0, _Digits) + " VOL 0" : "DESAT."));      
      
      if(!Add(label4)) return(false); 
            
      return(true); 
   }  
   
	bool CreateLabel5(void) 
   { 
      int x1=INDENT_LEFT;
      int y1= CONTROLS_GAP_Y * 12 + CONTROLS_DISTANCE_Y;
      int x2=x1 + INDENT_LEFT + 50;
      int y2=y1;
     
      if(!label5.Create(m_chart_id,m_name+"Label5",m_subwin,x1,y1,x2,y2)) return(false); 
      
      label5.FontSize(8);
      label5.Font("Tahoma");
      label5.Text("3ª PARC " + (IsParcial() ? DoubleToString(0, _Digits) + " VOL 0" : "DESAT."));      
      
      if(!Add(label5)) return(false); 
            
      return(true); 
   } 
   
	bool CreateLabel6(void) 
   { 
      int x1=INDENT_LEFT;
      int y1= CONTROLS_GAP_Y * 15 + CONTROLS_DISTANCE_Y;
      int x2=x1 + INDENT_LEFT + 60;
      int y2=y1;
     
      if(!label6.Create(m_chart_id,m_name+"Label6",m_subwin,x1,y1,x2,y2)) return(false); 
      
      label6.FontSize(8);
      label6.Font("Tahoma");
      label6.Text("BREAK EVEN " + (IsBreakEven() ? DoubleToString(0, _Digits) : "DESAT."));      
      
      if(!Add(label6)) return(false); 
            
      return(true); 
   } 
   
	bool CreateLabel7(void) 
   { 
      int x1=INDENT_LEFT;
      int y1= CONTROLS_GAP_Y * 18 + CONTROLS_DISTANCE_Y;
      int x2=x1 + INDENT_LEFT + 70;
      int y2=y1;
     
      if(!label7.Create(m_chart_id,m_name+"Label7",m_subwin,x1,y1,x2,y2)) return(false); 
      
      label7.FontSize(8);
      label7.Font("Tahoma");
      label7.Text("STOP C. ANTERIOR " + (IsStopOnLastCandle() ? "M0" : "DESAT."));      
      
      if(!Add(label7)) return(false); 
            
      return(true); 
   }        
   
	bool CreateBtnComprar(void)
   {
      int x1=INDENT_LEFT;
      int y1= CONTROLS_GAP_Y * 21 + CONTROLS_DISTANCE_Y * 2;
      int x2=x1+BUTTON_WIDTH;
      int y2=y1+BUTTON_HEIGHT;

      if(!btnComprar.Create(m_chart_id,m_name+"BtnComprar",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnComprar.Text("Comprar"))
         return(false);
      if(!Add(btnComprar))
         return(false);         

      return(true);
    }
    
    
   bool CreateBtnVender(void)
   {
      int x1=INDENT_LEFT+(BUTTON_WIDTH+CONTROLS_GAP_X);
      int y1= CONTROLS_GAP_Y * 21 + CONTROLS_DISTANCE_Y * 2;
      int x2=x1+BUTTON_WIDTH;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnVender.Create(m_chart_id,m_name+"BtnVender",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnVender.Text("Vender"))
         return(false);
      if(!Add(btnVender))
         return(false);
   
      return(true);
   }
   
   bool CreateBtnZerar(void)
   {
      int x1=INDENT_LEFT+(BUTTON_WIDTH+CONTROLS_GAP_X);
      int y1=BUTTON_HEIGHT + CONTROLS_GAP_Y * 24;
      int x2=x1+BUTTON_WIDTH;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnZerar.Create(m_chart_id,m_name+"BtnZerar",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnZerar.Text("Zerar"))
         return(false);
      if(!Add(btnZerar))
         return(false);
   
      return(true);
   }
   
   bool CreateBtnInverter(void)
   {
      int x1=INDENT_LEFT;
      int y1=BUTTON_HEIGHT + CONTROLS_GAP_Y * 24;
      int x2=x1+BUTTON_WIDTH;
      int y2=y1+BUTTON_HEIGHT;
   
      if(!btnInverter.Create(m_chart_id,m_name+"BtnInverter",m_subwin,x1,y1,x2,y2))
         return(false);
      if(!btnInverter.Text("Inverter"))
         return(false);
      if(!Add(btnInverter))
         return(false);
   
      return(true);
   }	               
	
	protected:
	
   EVENT_MAP_BEGIN(BadRobotUI)
      ON_EVENT(ON_CLICK,btnComprar,OnClickBtnComprar)
      ON_EVENT(ON_CLICK,btnVender,OnClickBtnVender)
      ON_EVENT(ON_CLICK,btnInverter,OnClickBtnInverter)
      ON_EVENT(ON_CLICK,btnZerar,OnClickBtnZerar)
      /*ON_EVENT(ON_CLICK,m_button3,OnClickButton3)
      ON_EVENT(ON_CHANGE,m_spin_edit,OnChangeSpinEdit)
      ON_EVENT(ON_CHANGE,m_date,OnChangeDate)
      ON_EVENT(ON_CHANGE,m_list_view,OnChangeListView)
      ON_EVENT(ON_CHANGE,m_combo_box,OnChangeComboBox)
      ON_EVENT(ON_CHANGE,m_radio_group,OnChangeRadioGroup)
      ON_EVENT(ON_CHANGE,m_check_group,OnChangeCheckGroup)*/
   EVENT_MAP_END(CAppDialog)
		
		
	public:
			
		BadRobotUI()
		{
         
		}			
		
		~BadRobotUI()
		{
		   CAppDialog::Destroy(_UninitReason);
		}	
		
		bool LoadBase()
		{
			if(_UninitReason == REASON_CHARTCHANGE)
			{
				return true;				
			}
			
			Comment("");
				
			CAppDialog::Destroy(_UninitReason);							
		   if(!CAppDialog::Create(0, GetRobotName() + " " + GetRobotVersion(), 0, 3, 50, PANEL_WIDTH, PANEL_HEIGHT))return(false);				   		   
		      
		   if(!CreateBtnComprar())return(false);
		   if(!CreateBtnVender())return(false);	  
		   if(!CreateBtnZerar())return(false);	  
		   if(!CreateBtnInverter())return(false);	
		   
		   if(!CreateLabel1())return(false);
		   if(!CreateLabel2())return(false);
		   if(!CreateLabel3())return(false);//Parcial 01
		   if(!CreateLabel4())return(false);//Parcial 02
		   if(!CreateLabel5())return(false);//Parcial 03
		   if(!CreateLabel6())return(false);//Break even
		   if(!CreateLabel7())return(false);//Stop Candle anterior
		   		   		   
		   BringToTop();
		   
		   btnComprar.ColorBackground(clrLightGreen);
		   btnComprar.Color(clrGreen);
		   btnComprar.Font("Tahoma");
		   btnComprar.FontSize(8);
		   
		   btnVender.ColorBackground(clrLightSalmon);
		   btnVender.Color(clrCrimson);
		   btnVender.Font("Tahoma");
		   btnVender.FontSize(8);		  
		   
		   btnInverter.ColorBackground(clrLightSkyBlue);
		   btnInverter.Color(clrNavy);
		   btnInverter.Font("Tahoma");
		   btnInverter.FontSize(8);
		   
			btnZerar.ColorBackground(clrLightGoldenrod);
		   btnZerar.Color(clrSaddleBrown);
		   btnZerar.Font("Tahoma");
		   btnZerar.FontSize(8);
		  		   
		   CAppDialog::Run();
		   
         return (true);
		}
		
		void OnClickBtnComprar()
      {         
         BadRobotCore::Buy();         
      }
		
		void OnClickBtnVender()
      {         
         BadRobotCore::Sell();         
      }	
      
		void OnClickBtnInverter()
      {         
         BadRobotCore::InvertPosition();         
      }	
      
		void OnClickBtnZerar()
      {         
         BadRobotCore::ClosePosition();         
      }	            
      
      void ShowInfo()
      {           
      
      	if(!IsRewrite()) return;
      	 
         label1.Text("POSIÇÃO " + GetPositionVolumeText());
         label2.Text("SL " + DoubleToString(ToPoints(GetStopLoss()), _Digits) + " TP " + DoubleToString(ToPoints(GetStopGain()), _Digits));
         
         label3.Text("1ª PARC " + (!IsPrimeiraParcial() && GetPrimeiraParcialInicio() > 0 && IsParcial() ? DoubleToString((GetPositionType() == POSITION_TYPE_SELL ? 
				                                                                     GetPositionPriceOpen() - ToPoints(GetPrimeiraParcialInicio()) : 
				                                                                     GetPositionPriceOpen() + ToPoints(GetPrimeiraParcialInicio())), _Digits) + " VOL " + (string)GetPrimeiraParcialVolume() + " " 
				                                                                     : (IsParcial() ? DoubleToString(0, _Digits) + " VOL 0" : "DESAT.")));//Parcial 01
				                                                                     
			label4.Text("2ª PARC " + (!IsSegundaParcial() && GetSegundaParcialInicio() > 0 && IsParcial() ? DoubleToString((GetPositionType() == POSITION_TYPE_SELL ? 
				                                                                     GetPositionPriceOpen() - ToPoints(GetSegundaParcialInicio()) : 
				                                                                     GetPositionPriceOpen() + ToPoints(GetSegundaParcialInicio())), _Digits) + " VOL " + (string)GetSegundaParcialVolume() + " " 
				                                                                     : (IsParcial() ? DoubleToString(0, _Digits) + " VOL 0" : "DESAT.")));//Parcial 02				                                                                     
				                                                                     
			label5.Text("3ª PARC " + (!IsTerceiraParcial() && GetTerceiraParcialInicio() > 0 && IsParcial() ? DoubleToString((GetPositionType() == POSITION_TYPE_SELL ? 
				                                                                     GetPositionPriceOpen() - ToPoints(GetTerceiraParcialInicio()) : 
				                                                                     GetPositionPriceOpen() + ToPoints(GetTerceiraParcialInicio())), _Digits) + " VOL " + (string)GetTerceiraParcialVolume() + " " 
				                                                                     : (IsParcial() ? DoubleToString(0, _Digits) + " VOL 0" : "DESAT.")));//Parcial 03			                                                                     				                                                                     
				                                                                     
			label6.Text("BREAK EVEN " + (IsBreakEven() ? DoubleToString((GetPositionType() == POSITION_TYPE_SELL ? 
			                                                                        GetPositionPriceOpen() - ToPoints(GetBreakEven()) :
			                                                                        GetPositionPriceOpen() + ToPoints(GetBreakEven())), _Digits) : "DESAT."));				                                                                     
			                                                                        

			label7.Text("STOP C. ANTERIOR " + (IsStopOnLastCandle() ? ToPeriodText(GetPeriodStopOnLastCandle()) : "DESAT."));			                                                                        
				                                                                     								                                                                     				                                                                     
         
      }	
	
};