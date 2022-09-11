# Created by: Robert Gogolok <gogo@cs.uni-sb.de>

PORTNAME=	bundler
PORTVERSION=	2.3.32
CATEGORIES=	sysutils rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool that manages gem dependencies for Ruby applications
WWW=		https://bundler.io/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

USES=		cpe gem
USE_RUBY=	yes

NO_ARCH=	yes

PLIST_FILES=	bin/bundle \
		bin/bundler

CONFLICTS_INSTALL=	go-tools # bin/bundle

post-install:
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' ${PREFIX}/bin/bundle ${PREFIX}/bin/bundler

.include <bsd.port.mk>
