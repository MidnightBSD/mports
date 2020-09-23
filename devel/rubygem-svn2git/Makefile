PORTNAME=	svn2git
PORTVERSION=	2.4.0
PORTREVISION=	1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby utilities for exporting SVN repo to git

LICENSE=	mit

RUN_DEPENDS=	git>0:devel/git

CONFLICTS_INSTALL=	svn2git-[0-9]*

NO_ARCH=	yes
USE_RUBY=	yes
USES=		gem
PLIST_FILES=	bin/svn2git

post-install:
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' ${PREFIX}/bin/svn2git
	

.include <bsd.port.mk>
