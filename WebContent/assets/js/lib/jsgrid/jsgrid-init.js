        $(function() {

            $("#jsGrid").jsGrid({
                height: "100%",
                width: "100%",
                filtering: false,
                editing: true,
                inserting: true,
                sorting: true,
                paging: true,
                autoload: true,
                pageSize: 10,
                pageButtonCount: 5,
                deleteConfirm: "Do you really want to delete the client?",
                controller: db,
                fields: [
					{type:"checkbox",width:"15%",
					headerTemplate:function(){
						return ' <input type="checkbox" id="cb" />全选';
					}},
					{ name: "", width:0,headerTemplate:function(){
						return "";
					},
					 itemTemplate: function(value, item) {
						 console.log(item);
						 $input="<input type='hidden' value='"+item.Age+"' />";
					    return $input;
					}},
                    { name: "Name", width: "15%", headerTemplate:function(){
						this.title="姓名";
						return (this.title === undefined || this.title === null) ? this.name : this.title;
					} },
                    { name: "Age", width: "15%" },
                    { name: "Address", width: "15%" },
                    // { name: "Country", type: "select", items: db.countries, valueField: "Id", textField: "Name" },
                    // { name: "Married", type: "checkbox", title: "Is Married", sorting: false },
                     { type: "control", width: "20%",
					  itemTemplate: function(value, item) {
						 //console.log(value);
						
						var $result = $([]);

						if(this.editButton) {
							
							$result = $result.add(this._createEditButton(item));
							//console.log($result[0]);
						}

						if(this.deleteButton) {
							$result = $result.add(this._createDeleteButton(item));
						}

						return $result;
					} }
					// {
					// 	type: "control",
					// 	modeSwitchButton: true,
					// 	editButton: false,
					// 	width: 30,
					// 	headerTemplate: function () {
					// 		$button = $("<button>").attr("type", "button").text("Filter")
					// 			.on("click", function () {
					// 				$("#jsGrid").jsGrid("option", "filtering", !($("#jsGrid").jsGrid("option", "filtering")));
					// 				return false;
					// 			});
					// 		//return $("p").html("kkkkk");
					// 	 
					// 		return $("<button>").attr("type", "button").text("Add")
					// 			.on("click", function () {
					// 				dialog.showDetailsDialog("Add", {});
					// 			});
					// 			}
     //                   
     //                }

                ]
            });

        });