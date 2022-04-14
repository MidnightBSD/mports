PORTNAME=	agrep
PORTVERSION=	2.04
PORTREVISION=	3
CATEGORIES=	textproc
MASTER_SITES=	GENTOO \
		ftp://ftp.cs.arizona.edu/agrep/ \
		ftp://ftp.cs.arizona.edu/agrep/:doc
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		agrep.ps.1.Z:doc agrep.ps.2.Z:doc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Approximate grep (fast approximate pattern-matching tool)

LICENSE=	agrep
LICENSE_NAME=	agrep
LICENSE_FILE=	${WRKSRC}/COPYRIGHT
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

NO_CDROM=	No redistribution for profit

USES= tar:Z

ALL_TARGET=
MAKE_ARGS=	CFLAGS="${CFLAGS}"
PORTDOCS=	COPYRIGHT agrep.algorithms agrep.ps.1.Z agrep.ps.2.Z

OPTIONS_DEFINE=	DOCS

post-extract:
	${CP} ${DISTDIR}/agrep.ps.1.Z ${DISTDIR}/agrep.ps.2.Z ${WRKSRC}/

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/agrep ${PREFIX}/bin/
	@${INSTALL_MAN} ${WRKSRC}/agrep.1 ${PREFIX}/man/man1/
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}/
.endif

.include <bsd.port.mk>
