
[1mFrom:[0m /home/ubuntu/workspace/desktop/app/controllers/house_modules_controller.rb @ line 44 HouseModulesController#create:

    [1;34m41[0m: [32mdef[0m [1;34mcreate[0m
    [1;34m42[0m:   @house_module = [1;34;4mHouseModule[0m.new(house_module_params)
    [1;34m43[0m:   byebug
 => [1;34m44[0m:   respond_to [32mdo[0m |format|
    [1;34m45[0m:     [32mif[0m @house_module.save
    [1;34m46[0m:       format.html { redirect_to @house_module, [35mnotice[0m: [31m[1;31m'[0m[31mHouse module was successfully created.[1;31m'[0m[31m[0m }
    [1;34m47[0m:       format.json { render [33m:show[0m, [35mstatus[0m: [33m:created[0m, [35mlocation[0m: @house_module }
    [1;34m48[0m:     [32melse[0m
    [1;34m49[0m:       format.html { render [33m:new[0m }
    [1;34m50[0m:       format.json { render [35mjson[0m: @house_module.errors, [35mstatus[0m: [33m:unprocessable_entity[0m }
    [1;34m51[0m:     [32mend[0m
    [1;34m52[0m:   [32mend[0m
    [1;34m53[0m: [32mend[0m

