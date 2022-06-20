FIXTURES = {
  :chores_list_json_response => {
    :object=>"list",
    :results=>
    [{:object=>"page",
      :id=>"06ad2d6b-414e-4b27-aa76-0bd66a8f4f31",
      :created_time=>"2022-04-20T19:50:00.000Z",
      :last_edited_time=>"2022-04-26T23:30:00.000Z",
      :created_by=>
      {:object=>"user", :id=>"8a907d9f-eadc-4a91-8d56-3db0410828fd"},
      :last_edited_by=>
      {:object=>"user", :id=>"8a907d9f-eadc-4a91-8d56-3db0410828fd"},
      :cover=>nil,
      :icon=>nil,
      :parent=>
      {:type=>"database_id",
       :database_id=>"80a895ac-4db6-4ac8-ac50-bad0ce2603a1"},
      :archived=>false,
      :properties=>
      {:Assignees=>
       {:id=>"K%5Dmc",
        :type=>"multi_select",
        :multi_select=>
        [{:id=>"0a7c9ff5-4250-4242-83d4-79ade5d16721",
          :name=>"Casey",
          :color=>"blue"},
         {:id=>"cfb00019-e220-4ce2-bd21-0648984d4b4e",
          :name=>"Elayne",
          :color=>"green"}]},
       :Room=>
       {:id=>"LJGw",
        :type=>"select",
        :select=>
        {:id=>"3fd9b2e2-a52b-4d47-aa4b-b8d156edb50d",
         :name=>"Dining Room",
         :color=>"blue"}},
       :Notes=>{:id=>"MEYg", :type=>"rich_text", :rich_text=>[]},
       :Frequency=>
       {:id=>"NO~%3B",
        :type=>"select",
        :select=>
        {:id=>"1da0da96-8187-4cc4-b896-4193c874a4d4",
         :name=>"weekly",
         :color=>"yellow"}},
       :Name=>
       {:id=>"title",
        :type=>"title",
        :title=>
        [{:type=>"text",
          :text=>{:content=>"Sweep and mop the dining room", :link=>nil},
          :annotations=>
          {:bold=>false,
           :italic=>false,
           :strikethrough=>false,
           :underline=>false,
           :code=>false,
           :color=>"default"},
          :plain_text=>"Sweep and mop the dining room",
          :href=>nil}]}},
      :url=>
      "https://www.notion.so/Sweep-and-mop-the-dining-room-06ad2d6b414e4b27aa760bd66a8f4f31"},
     {:object=>"page",
      :id=>"5f5c16b4-0a60-4b4b-b63a-3b61a34b7c4d",
      :created_time=>"2022-04-20T19:50:00.000Z",
      :last_edited_time=>"2022-06-19T15:21:00.000Z",
      :created_by=>
      {:object=>"user", :id=>"8a907d9f-eadc-4a91-8d56-3db0410828fd"},
      :last_edited_by=>
      {:object=>"user", :id=>"8a907d9f-eadc-4a91-8d56-3db0410828fd"},
      :cover=>nil,
      :icon=>nil,
      :parent=>
      {:type=>"database_id",
       :database_id=>"80a895ac-4db6-4ac8-ac50-bad0ce2603a1"},
      :archived=>false,
      :properties=>
      {:Assignees=>
       {:id=>"K%5Dmc",
        :type=>"multi_select",
        :multi_select=>
        [{:id=>"0a7c9ff5-4250-4242-83d4-79ade5d16721",
          :name=>"Casey",
          :color=>"blue"},
         {:id=>"cfb00019-e220-4ce2-bd21-0648984d4b4e",
          :name=>"Elayne",
          :color=>"green"}]},
       :Room=>
       {:id=>"LJGw",
        :type=>"select",
        :select=>
        {:id=>"a1c2d8db-b1bd-4f51-a077-bafee00ea080",
         :name=>"Entrance",
         :color=>"purple"}},
       :Notes=>{:id=>"MEYg", :type=>"rich_text", :rich_text=>[]},
       :Frequency=>
       {:id=>"NO~%3B",
        :type=>"select",
        :select=>
        {:id=>"1da0da96-8187-4cc4-b896-4193c874a4d4",
         :name=>"weekly",
         :color=>"yellow"}},
       :Name=>
       {:id=>"title",
        :type=>"title",
        :title=>
        [{:type=>"text",
          :text=>{:content=>"Declutter entrance hallway", :link=>nil},
          :annotations=>
          {:bold=>false,
           :italic=>false,
           :strikethrough=>false,
           :underline=>false,
           :code=>false,
           :color=>"default"},
          :plain_text=>"Declutter entrance hallway",
          :href=>nil}]}},
      :url=>
      "https://www.notion.so/Declutter-entrance-hallway-5f5c16b40a604b4bb63a3b61a34b7c4d"}],
    :next_cursor=>nil,
    :has_more=>false,
    :type=>"page",
    :page=>{}
  },

  :assignments_list_json_response => {
    :object=>"list",
    :results=>
    [{:object=>"page",
      :id=>"21cb7429-2578-4be5-a628-82a34265b07d",
      :created_time=>"2022-05-16T20:57:00.000Z",
      :last_edited_time=>"2022-06-20T00:50:00.000Z",
      :created_by=>
      {:object=>"user", :id=>"58274393-1e89-46c1-87a9-10d66ad6411c"},
      :last_edited_by=>
      {:object=>"user", :id=>"8a907d9f-eadc-4a91-8d56-3db0410828fd"},
      :cover=>nil,
      :icon=>nil,
      :parent=>
      {:type=>"database_id",
       :database_id=>"5c3815fb-b2da-4c16-904a-99e57177e2ae"},
      :archived=>false,
      :properties=>
      {:Chore=>
       {:id=>"FYuv",
        :type=>"relation",
        :relation=>[{:id=>"06ad2d6b-414e-4b27-aa76-0bd66a8f4f31"}]},
       :Done=>{:id=>"Le%5Bd", :type=>"checkbox", :checkbox=>true},
       :Due=>
       {:id=>"SjjB",
        :type=>"date",
        :date=>{:start=>"2022-06-19", :end=>nil, :time_zone=>nil}},
       :Assignee=>
       {:id=>"~Jv%5C",
        :type=>"rich_text",
        :rich_text=>
        [{:type=>"text",
          :text=>{:content=>"Elayne", :link=>nil},
          :annotations=>
          {:bold=>false,
           :italic=>false,
           :strikethrough=>false,
           :underline=>false,
           :code=>false,
           :color=>"default"},
          :plain_text=>"Elayne",
          :href=>nil}]},
       :Name=>{:id=>"title", :type=>"title", :title=>[]}},
      :url=>"https://www.notion.so/21cb742925784be5a62882a34265b07d"},
     {:object=>"page",
      :id=>"70375662-662d-49d9-9fc2-904633eb548a",
      :created_time=>"2022-05-15T02:58:00.000Z",
      :last_edited_time=>"2022-06-20T00:51:00.000Z",
      :created_by=>
      {:object=>"user", :id=>"58274393-1e89-46c1-87a9-10d66ad6411c"},
      :last_edited_by=>
      {:object=>"user", :id=>"8a907d9f-eadc-4a91-8d56-3db0410828fd"},
      :cover=>nil,
      :icon=>nil,
      :parent=>
      {:type=>"database_id",
       :database_id=>"5c3815fb-b2da-4c16-904a-99e57177e2ae"},
      :archived=>false,
      :properties=>
      {:Chore=>
       {:id=>"FYuv",
        :type=>"relation",
        :relation=>[{:id=>"4eb4fe71-383f-4d30-a583-e8bdae5af030"}]},
       :Done=>{:id=>"Le%5Bd", :type=>"checkbox", :checkbox=>false},
       :Due=>
       {:id=>"SjjB",
        :type=>"date",
        :date=>{:start=>"2022-06-19", :end=>nil, :time_zone=>nil}},
       :Assignee=>
       {:id=>"~Jv%5C",
        :type=>"rich_text",
        :rich_text=>
        [{:type=>"text",
          :text=>{:content=>"Casey", :link=>nil},
          :annotations=>
          {:bold=>false,
           :italic=>false,
           :strikethrough=>false,
           :underline=>false,
           :code=>false,
           :color=>"default"},
          :plain_text=>"Casey",
          :href=>nil}]},
       :Name=>{:id=>"title", :type=>"title", :title=>[]}},
      :url=>"https://www.notion.so/70375662662d49d99fc2904633eb548a"},
     {:object=>"page",
      :id=>"f0b8cf9a-ed6a-4b50-8880-ee1a5a3feb56",
      :created_time=>"2022-05-14T19:01:00.000Z",
      :last_edited_time=>"2022-06-20T00:50:00.000Z",
      :created_by=>
      {:object=>"user", :id=>"8a907d9f-eadc-4a91-8d56-3db0410828fd"},
      :last_edited_by=>
      {:object=>"user", :id=>"8a907d9f-eadc-4a91-8d56-3db0410828fd"},
      :cover=>nil,
      :icon=>nil,
      :parent=>
      {:type=>"database_id",
       :database_id=>"5c3815fb-b2da-4c16-904a-99e57177e2ae"},
      :archived=>false,
      :properties=>
      {:Chore=>
       {:id=>"FYuv",
        :type=>"relation",
        :relation=>[{:id=>"5f5c16b4-0a60-4b4b-b63a-3b61a34b7c4d"}]},
       :Done=>{:id=>"Le%5Bd", :type=>"checkbox", :checkbox=>true},
       :Due=>
       {:id=>"SjjB",
        :type=>"date",
        :date=>{:start=>"2022-06-12", :end=>nil, :time_zone=>nil}},
       :Assignee=>
       {:id=>"~Jv%5C",
        :type=>"rich_text",
        :rich_text=>
        [{:type=>"text",
          :text=>{:content=>"Casey", :link=>nil},
          :annotations=>
          {:bold=>false,
           :italic=>false,
           :strikethrough=>false,
           :underline=>false,
           :code=>false,
           :color=>"default"},
          :plain_text=>"Casey",
          :href=>nil}]},
       :Name=>{:id=>"title", :type=>"title", :title=>[]}},
      :url=>"https://www.notion.so/f0b8cf9aed6a4b508880ee1a5a3feb56"}],
    :next_cursor=>nil,
    :has_more=>false,
    :type=>"page",
    :page=>{}
  }
}
