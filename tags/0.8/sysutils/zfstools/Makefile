# $MidnightBSD$

PORTNAME=	zfstools
DISTVERSIONPREFIX=v
DISTVERSION=	0.3.6
PORTREVISION=	0
CATEGORIES=	sysutils ruby
MASTER_SITES=	GH \
		http://mirror.shatow.net/freebsd/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenSolaris-compatible auto snapshotting for ZFS

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USE_GITHUB=	yes
GH_ACCOUNT=	bdrewery

USE_RUBY=	yes
NO_BUILD=	yes

SUB_FILES=	pkg-message

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

do-install:
	@cd ${WRKSRC}/bin && ${COPYTREE_BIN} . ${PREFIX}/sbin
	@cd ${WRKSRC}/lib && ${COPYTREE_SHARE} . ${RUBY_SITELIBDIR}
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README.md ${DOCSDIR}

.include <bsd.port.mk>
