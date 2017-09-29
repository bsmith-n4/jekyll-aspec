require 'test/unit'
require 'asciidoctor'
require_relative '../lib/jekyll_aspec'

class TestSampleFile < Test::Unit::TestCase

  


	def test_convert_sample_file
  sample = "test/_docs/document1.adoc"
  Asciidoctor.convert_file sample, header_footer: false
  html = File.read('test/_docs/document1.html')
  assert_equal("<div class=\"paragraph\">\n<p>content\n</div>\n<div id=\"123\" class=\"admonitionblock requirement\">\n<table>\n<tr>\n<td class=\"icon\">\n<div class=\"title\"></div>\n</td>\n<td class=\"content\">\n<div class=\"title\">Requirement 123 Title</div>\n<div class=\"paragraph\">\n<p>\n\n<div class=\"panel panel-primary\"> \n<div class=\"panel-heading\"> \n<h3 class=\"panel-title\">\n<a class=\"anchor\" href=\"#123\"></a>\n<a class=\"link\" href=\"#123\"><emphasis role=\"strong\">Requirement: 123:</emphasis> Requirement 123 Title </a> (ver. 1)\n</h3> \n</div> \n<div class=\"panel-body\">\n\n</div>\n<div class=\"paragraph\">\n<p>Content of the requirement\n</div>\n<div class=\"paragraph\">\n<p>\n</div></div>\n\n</div>\n</td>\n</tr>\n</table>\n</div>\n<div class=\"paragraph\">\n<p><a href=\"#Document One\">[Document One]</a>\n</div>\n<div class=\"paragraph\">\n<p><a href=\"#Document Two\">[Document Two]</a>\n</div>\n<h2 id=\"requirements\"><a class=\"anchor\" href=\"#requirements\"></a><a class=\"link\" href=\"#requirements\">Requirements</a></h2>\n<div class=\"panel panel-default\"> <div class=\"panel-heading\"><h4>Requirements</h4></div>\n<table class=\"table\"> <thead> <tr>\n<th>#</th> <th>ID</th><th>Version</th> <th>Title</th> <th>Document</th>\n</tr> </thead>\n<tbody>\n<tr> <th scope=\"row\">1</th> <td>123</td><td>1</td> <td><a class=\"link\" href=\"test/_docs/document1/index#123\"><emphasis role=\"strong\">Requirement 123 Title\n</emphasis>  </a></td> <td><a href=\"test/_docs/document1\"> / </a></td> </tr><tr> <th scope=\"row\">2</th> <td>123</td><td>1</td> <td><a class=\"link\" href=\"test/_docs/document3/index#123\"><emphasis role=\"strong\">Requirement 123 Title\n</emphasis>  </a></td> <td><a href=\"test/_docs/document3\"> / </a></td> </tr><tr> <th scope=\"row\">3</th> <td>456</td><td>1</td> <td><a class=\"link\" href=\"test/_docs/subdir/document2/index#456\"><emphasis role=\"strong\">Requirement 456 Title\n</emphasis>  </a></td> <td><a href=\"test/_docs/subdir/document2\">subdir / Document Two</a></td> </tr>\n</tbody>\n</table> </div>", 
		html)
	end

  def test_convert_multiple
  sample = "test/_docs/subdir/document2.adoc"
  Asciidoctor.convert_file sample, header_footer: false
  html = File.read('test/_docs/subdir/document2.html')
  assert_equal("<hr>\n<div class=\"paragraph\">\n<p>chapter: subdir\ntitle: Document Two\n---\n</div>\n<h1 id=\"_document_two\" class=\"sect0\">Document Two</h1>\n<div class=\"paragraph\">\n<p>A lovely piece of text here\n</div>\n<div id=\"456\" class=\"admonitionblock requirement\">\n<table>\n<tr>\n<td class=\"icon\">\n<div class=\"title\"></div>\n</td>\n<td class=\"content\">\n<div class=\"title\">Requirement 456 Title</div>\n<div class=\"paragraph\">\n<p>\n\n<div class=\"panel panel-primary\"> \n<div class=\"panel-heading\"> \n<h3 class=\"panel-title\">\n<a class=\"anchor\" href=\"#456\"></a>\n<a class=\"link\" href=\"#456\"><emphasis role=\"strong\">Requirement: 456:</emphasis> Requirement 456 Title </a> (ver. 1)\n</h3> \n</div> \n<div class=\"panel-body\">\n\n</div>\n<div class=\"paragraph\">\n<p>Content of the requirement\n</div>\n<div class=\"paragraph\">\n<p>\n</div></div>\n\n</div>\n</td>\n</tr>\n</table>\n</div>\n<div class=\"literalblock\">\n<div class=\"content\">\n<pre>Req-456 </pre>\n</div>\n</div>\n<div class=\"literalblock\">\n<div class=\"content\">\n<pre>Req-123 </pre>\n</div>\n</div>\n<div class=\"sect1\">\n<h2 id=\"_section_two\">Section Two</h2>\n<div class=\"sectionbody\">\n<div class=\"paragraph\">\n<p><a href=\"http://www.example.com/issues/123\"><span class=\"label label-default\">123</span></a>\n</div>\n<div class=\"paragraph\">\n<p><a href=\"#Document One\">[Document One]</a>\n</div>\n<div class=\"ulist\">\n<ul>\n<li>\n<p>See <a href=\"http://www.github.com/exampleuser/dockerfiles/blob/master/ansible/Dockerfile_template\" style=\"padding-right:2px;\">\n<span class=\"label label-info\" style=\"font-weight: 400;\nfont-size:smaller;\">\n<i class=\"fa fa-github fa-lg\"></i>\nansible/Dockerfile_template\n</span>\n</a> for more details\n</li>\n</ul>\n</div>\n</div>\n</div>", 
    html)
  end

  def test_magic_xref
  sample = "test/_docs/document3.adoc"
  attrs = "reproducible=true,!stylesheet=true,xref-base=/bsmith/cd-spec-jekyll"
  Asciidoctor.convert_file sample, header_footer: false
  html = File.read('test/_docs/document3.html')
  assert_equal("<div class=\"paragraph\">\n<p>content\n</div>\n<div id=\"123\" class=\"admonitionblock requirement\">\n<table>\n<tr>\n<td class=\"icon\">\n<div class=\"title\"></div>\n</td>\n<td class=\"content\">\n<div class=\"title\">Requirement 123 Title</div>\n<div class=\"paragraph\">\n<p>\n\n<div class=\"panel panel-primary\"> \n<div class=\"panel-heading\"> \n<h3 class=\"panel-title\">\n<a class=\"anchor\" href=\"#123\"></a>\n<a class=\"link\" href=\"#123\"><emphasis role=\"strong\">Requirement: 123:</emphasis> Requirement 123 Title </a> (ver. 1)\n</h3> \n</div> \n<div class=\"panel-body\">\n\n</div>\n<div class=\"paragraph\">\n<p>Content of the requirement\n</div>\n<div class=\"paragraph\">\n<p>\n</div></div>\n\n</div>\n</td>\n</tr>\n</table>\n</div>\n<div class=\"paragraph\">\n<p><a href=\"#Document One\">[Document One]</a>\n</div>\n<div class=\"paragraph\">\n<p><a href=\"#Document Two\">[Document Two]</a>\n</div>\n<h2 id=\"requirements\"><a class=\"anchor\" href=\"#requirements\"></a><a class=\"link\" href=\"#requirements\">Requirements</a></h2>\n<div class=\"panel panel-default\"> <div class=\"panel-heading\"><h4>Requirements</h4></div>\n<table class=\"table\"> <thead> <tr>\n<th>#</th> <th>ID</th><th>Version</th> <th>Title</th> <th>Document</th>\n</tr> </thead>\n<tbody>\n<tr> <th scope=\"row\">1</th> <td>123</td><td>1</td> <td><a class=\"link\" href=\"test/_docs/document1/index#123\"><emphasis role=\"strong\">Requirement 123 Title\n</emphasis>  </a></td> <td><a href=\"test/_docs/document1\"> / </a></td> </tr><tr> <th scope=\"row\">2</th> <td>123</td><td>1</td> <td><a class=\"link\" href=\"test/_docs/document3/index#123\"><emphasis role=\"strong\">Requirement 123 Title\n</emphasis>  </a></td> <td><a href=\"test/_docs/document3\"> / </a></td> </tr><tr> <th scope=\"row\">3</th> <td>456</td><td>1</td> <td><a class=\"link\" href=\"test/_docs/subdir/document2/index#456\"><emphasis role=\"strong\">Requirement 456 Title\n</emphasis>  </a></td> <td><a href=\"test/_docs/subdir/document2\">subdir / Document Two</a></td> </tr>\n</tbody>\n</table> </div>", 
    html)
  end
end
