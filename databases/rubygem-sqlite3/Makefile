PORTNAME=	sqlite3
PORTVERSION=	2.6.0
CATEGORIES=	databases rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby interface to the SQLite DB engine version 3
WWW=		https://github.com/sparklemotion/sqlite3-ruby

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gem sqlite

CONFIGURE_ARGS=	--enable-system-libraries --with-sqlite3-dir=${LOCALBASE}

# Clean up bundled libraries
post-patch:
	@${RM} -r ${WRKSRC}/ports/

.include <bsd.port.mk>
