PORTNAME=	ruby-graphviz
PORTVERSION=	1.2.5
CATEGORIES=	graphics ruby rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby Interface to the GraphViz Graphing Tool
WWW=		https://github.com/glejeune/Ruby-Graphviz

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING.md

RUN_DEPENDS=	gxl2dot:graphics/graphviz \
		rubygem-rexml>=0:textproc/rubygem-rexml

USES=		gem

NO_ARCH=	yes

PLIST_FILES=	bin/dot2ruby \
		bin/gem2gv \
		bin/git2gv \
		bin/ruby2gv \
		bin/xml2gv

.include <bsd.port.mk>
