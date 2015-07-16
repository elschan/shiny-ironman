
[1mFrom:[0m /vagrant/final-project/app/controllers/posts_controller.rb @ line 25 PostsController#index:

     [1;34m5[0m:   [32mdef[0m [1;34mindex[0m
     [1;34m6[0m: 
     [1;34m7[0m:     [1;34m# TODO sort chronologically or by upvotes/time[0m
     [1;34m8[0m:     [32mif[0m params[[33m:search[0m]
     [1;34m9[0m:       @tags = []
    [1;34m10[0m:       @posts = []
    [1;34m11[0m:       tags = params[[33m:search[0m].downcase.gsub([35m[1;35m/[0m[35m[^a-z0-9[1;35m\s[0m[35m][1;35m/[0m[35m[35mi[0m[35m[0m, [31m[1;31m'[0m[31m[1;31m'[0m[31m[0m).split([31m[1;31m'[0m[31m [1;31m'[0m[31m[0m)
    [1;34m12[0m:       tags.each [32mdo[0m |tag|
    [1;34m13[0m:         [32munless[0m [1;34;4mTag[0m.find_by([35mname[0m: tag) == [1;36mnil[0m
    [1;34m14[0m:         @tags << [1;34;4mTag[0m.find_by([35mname[0m: tag)
    [1;34m15[0m:         [32mend[0m
    [1;34m16[0m:       [32mend[0m
    [1;34m17[0m:       @tags.each [32mdo[0m |tag|
    [1;34m18[0m:         @posts << tag.posts
    [1;34m19[0m:       [32mend[0m
    [1;34m20[0m:       @posts.flatten!
    [1;34m21[0m:       @posts.uniq!
    [1;34m22[0m:     [32melsif[0m params[[33m:tag[0m]
    [1;34m23[0m:       @posts = [1;34;4mPost[0m.tagged_with(params[[33m:tag[0m])
    [1;34m24[0m:       @posts.uniq!
 => [1;34m25[0m:       binding.pry
    [1;34m26[0m:     [32melse[0m
    [1;34m27[0m:     @posts = [1;34;4mPost[0m.all
    [1;34m28[0m:   [32mend[0m
    [1;34m29[0m: [32mend[0m

