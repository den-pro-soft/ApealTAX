class SelectionPropertyController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index

  	@search_data_property  = ""
  	@search_data_pin       = ""

  	@check = 'property'


    #Check Search method(with Address Property or Address PIN)
  	if params['address_property'] || params['address_pin']

  		@check = params['search']
  		
      if @check == 'property'

	  		@search_data_property = params['address_property']
	  		@properties = Property.search_for_fulladdress(@search_data_property)

	  	elsif @check == 'pin'

	  		@search_data_pin = params['address_pin']
	  		@properties = Property.search_for_pin(@search_data_pin)

	  	end

  	end

  end

  def confirm

    
    # Save UserId
    if session[:userId].nil?

      # Just Using Sample UserId (Will Change)
      session[:userId]                = "10156094129854648"

    end

    @userId = session[:userId]
    @user = User.search_for_userId(@userId).first

    #Save UserData to Case Table
    if session[:case_id].nil?

      case_data = Case.create(
        property_id:        params['property_id'],
        user_id:            @userId,
        firstName:          @user.firstName,
        lastName:           @user.lastName,
        address:            @user.address,
        email:              @user.email,
        company:            @user.companyName,
      )
      session[:case_id] = Case.last.id
      session[:property_id] = params['property_id']

    else 

      if params['property_id']

         @case_update = Case.search_for_case_data(session[:case_id]).first
         @case_update.property_id = params['property_id']
         @case_update.save
         session[:property_id] = params['property_id']

      end

    end

    property_id = session[:property_id]
    #Create Data on User_Property Table
    @property = Property.search_for_id(property_id).first

    #==================Address Parsing==================================
    @address = @property.fulladdress.split(',')[0]
    if @property.fulladdress.split(',')[1]
      @address = @address + ' ' + @property.fulladdress.split(',')[1]
    end

    @create_or_update = UserProperty.search_for_case_id(session[:case_id]).first

    if @create_or_update.nil?
      #==================Create User_Property=============================
      user_property = UserProperty.create(
        caseId:             session[:case_id],
        propertyId:         property_id,
        pin:                @property.pin,
        neighborhood:       @property.neighborhood,
        address:            @address,
        city:               @property.city,
        appartments:        @property.apt_desc,
        exteriorConstruct:  @property.ext_desc,
        fullBaths:          @property.full_bath,
        halfBaths:          @property.half_bath,
        basementCondition:  @property.bsmt_desc,
        atticCondition:     @property.attic_desc,
        ac:                 @property.ac,
        fireplaces:         @property.fireplace,
        garageType:         @property.gar_desc,
        buildingSF:         @property.building_sq_ft,
        landSF:             @property.land_sq_ft,
        age:                @property.age,
        township:           @property.township,
        property_image:     @property.property_image,
        s3_property_image:  @property.s3_property_image,
        realtorId:          @user.realtorId,
        userId:             @userId,
        first_name:         @user.firstName,
        last_name:          @user.lastName,
        company:            @user.companyName
        )
    else 

        @create_or_update.propertyId          = property_id
        @create_or_update.pin                 = @property.pin
        @create_or_update.neighborhood        = @property.neighborhood
        @create_or_update.address             = @address
        @create_or_update.city                = @property.city
        @create_or_update.appartments         = @property.apt_desc
        @create_or_update.exteriorConstruct   = @property.ext_desc
        @create_or_update.fullBaths           = @property.full_bath
        @create_or_update.halfBaths           = @property.half_bath
        @create_or_update.basementCondition   = @property.bsmt_desc
        @create_or_update.atticCondition      = @property.attic_desc
        @create_or_update.ac                  = @property.ac
        @create_or_update.fireplaces          = @property.fireplace
        @create_or_update.garageType          = @property.gar_desc
        @create_or_update.buildingSF          = @property.building_sq_ft
        @create_or_update.landSF              = @property.land_sq_ft
        @create_or_update.age                 = @property.age
        @create_or_update.township            = @property.township
        @create_or_update.property_image      = @property.property_image
        @create_or_update.s3_property_image   = @property.s3_property_image
        @create_or_update.save
      
    end

  end

  def sales

    @userId = session[:userId]

    if params['commit'] == "Correct - Next Step"

      @update = UserProperty.search_for_userId(@userId).first

      @update.appartments       = params['apt_desc']
      @update.exteriorConstruct = params['ext_desc']
      @update.fullBaths         = params['full_bath']
      @update.halfBaths         = params['half_bath']
      @update.basementCondition = params['bsmt_desc']
      @update.atticCondition    = params['attic_desc']
      @update.ac                = params['ac']
      @update.fireplaces        = params['fireplace']
      @update.garageType        = params['gar_desc']
      @update.buildingSF        = params['building_sq_ft']
      @update.landSF            = params['land_sq_ft']
      @update.age               = params['age']
      
      @update.save

    end
    #=======================Save User_Property   FOR STEP 2==========================
    if params['authenticity_token']

      session[:user_property]   = params

    end

  end

  def exemptions

    @userId = session[:userId]

    @user_property = UserProperty.search_for_userId(@userId).first

    @additional_data = AddtionalDatum.create(

      hasAdditionalPins:          params['hadAdditionalPins'],
      condominium:                params['condominium'],
      condoAssociation:           params['condoAssociation'],
      associationName:            params['associationName'],
      contact:                    params['contact'],
      phone:                      params['phone_number'],
      pin1:                       params['pin1'],
      pin2:                       params['pin2'],
      pin3:                       params['pin3'],
      caseId:                     session[:case_id],
      propertyId:                 @user_property.id,
      userId:                     @userId
    )

    @sales_info = SalesInfo.create(
      propertyId:                           @user_property.id,
      purchasedFiveYears:                   params['purchasedFiveYears'],
      purchasePrice:                        params['purchasePrice'],
      purchaseDate:                         params['purchaseDate'],
      distressedSale:                       params['distressedSale'],
      mostRecentRefinance:                  params['mostRecentRefinance'],
      appraisedValueRefinance:              params['appraisedValueRefinance'],
      interestRate:                         params['interestRate'],
      vacancy3months:                       params['vacancy3months'],
      tornDown:                             params['torn_down'],
      caseId:                               session[:case_id],
      interestTerm:                         params['interestTerm'],
      sellingHouseDate:                     params['sellingHouseDate'],
      refinancedFiveYears:                  params['refinancedFive'],
      rebuiltDate:                          params['rebuiltDate'],
      propertyRebuilt:                      params['property_rebuilt'],
      userId:                               @userId
    )

    #===========================Save Sales_Data to Session    FOR STEP3 =====================
    if params['authenticity_token']

      session[:sales_data]  = params

    end

  end

  def save

    @userId = session[:userId]

    @user_property = UserProperty.search_for_userId(@userId).first

    @exemption = Exemption.create(

        propertyId:                           @user_property.id,
        primaryResidence:                     params['primaryResidence'],
        exemptionOnAnotherProperty:           params['exemptionOnAnotherProperty'],
        over65:                               params['over65'],
        yearBorn:                             params['yearBorn'],
        caseId:                               session[:case_id],
        userId:                               @userId
    )
    #===========================Save Exemption_Data to Session     FOR STEP4 ==================
    if params['authenticity_token']

      session[:exemption_data]  = params 
    
    end
  end

  def contract

    @userId = session[:userId]

    @update = UserProperty.search_for_userId(@userId).first

    @update.first_name                      = params['first_name']
    @update.last_name                       = params['last_name']
    @update.company                         = params['company']

    @update.save

    #==========================Save Contract Data to Session    FOR STEP 5 ==========================
    if params['authenticity_token']

      session[:contract_data]   = params

    end
    #==========================Sign Url====================================
    @userId = session[:userId]
    @user = User.search_for_userId(@userId).first

    @property = Property.search_for_id(session['property_id']).first

    @address = @property.fulladdress.split(',')[0]

    if @property.fulladdress.split(',')[1]
      @address = @address + ' ' + @property.fulladdress.split(',')[1]
    end
    
    @purchase1 = @purchase2 = ''
    if session[:sales_data]["mostRecentRefinance"]!=''
      year = session[:sales_data]["mostRecentRefinance"].split('/')[2]
      if year.to_i >= 2015
        @purchase2 = 'X'
        @purchase1 = ''
      elsif 
        @purchase1 = 'X'
        @purchase2 = ''
      end
    end


    @Client_UserName                      = @user.firstName + ' '+ @user.lastName
    @Client_Email                         = @user.email
    @Client_township1                     = @property.township
    @Client_pin1                          = @property.pin
    @Client_percent                       = 33
    @Client_address1                      = @address
    @Client_city1                         = @property.city
    @Client_company1                      = session[:contract_data]['company']
    @Client_owner1                        = @Client_company1 == "" ? "X" : ""
    @Client_agent1                        = @Client_company1 != "" ? "X" : ""
    @Client_Purchase1                     = @purchase1
    @Client_Purchase2                     = @purchase2
    @Client_purchaseprice1                = session[:sales_data]['purchasePrice']
    @Client_purchasedate1                 = session[:sales_data]['purchaseDate']
    @Client_fixed1                        = ''
    @Client_variable1                     = ''
    @Client_purchaserate                  = session[:sales_data]['interestRate']
    @Client_refi1                         = session[:sales_data]['refinancedFive'] == 'Yes' ? 'X' : '' 

    @sign_url = "https://demo.docusign.net/Member/PowerFormSigning.aspx?PowerFormId=a8b8c546-4489-4918-a1d0-eafa8c41c9f5" + 
                '&Client_UserName='           + @Client_UserName +
                '&Client_Email='              + @Client_Email +
                '&Client_township1'           + @Client_township1 +
                '&Client_pin1='               + @Client_pin1.to_s +
                '&Client_percent='            + @Client_percent.to_s + 
                '&Client_address1='           + @Client_address1 +
                '&Client_city1='              + @Client_city1 + 
                '&Client_owner1='             + @Client_owner1 + 
                '&Client_company1='           + @Client_company1 + 
                '&Client_agent1='             + @Client_agent1 + 
                '&Client_Purchase1='          + @Client_Purchase1 +
                '&Client_Purchase2='          + @Client_Purchase2 +
                '&Client_purchaseprice1='     + @Client_purchaseprice1 +
                '&Client_purchasedate1='      + @Client_purchasedate1 + 
                '&Client_fixed1='             + @Client_fixed1 +
                '&Client_variable1='          + @Client_variable1 + 
                '&Client_purchaserate='       + @Client_purchaserate + 
                '&Client_refi1='              + @Client_refi1

    @amount = 2500

    customer  = Stripe::Customer.create(
                      :email        => params[:stripeEmail],
                      :source       => params[:stripeToken]
                )

    charge    = Stripe::Charge.create(
                      :customer     => customer.id,
                      :amount       => @amount,
                      :description  => 'Customer',
                      :currency     => 'usd'
                )

    rescue Stripe::CardError => e
      flash[:error] = e.message
                 
  end

end
