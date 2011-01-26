# $MidnightBSD: mports/mbone/imm/Makefile,v 1.2 2008/05/22 16:36:15 laffer1 Exp $

PORTNAME=	imm
PORTVERSION=	3.5a1
PORTREVISION=	1
CATEGORIES=	mbone tk
MASTER_SITES=	ftp://ftp.hawaii.edu/paccom/imm-3.5a1/
DISTNAME=	imm.source
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Internet Image(or other data) Multicaster (and receiver)
LICENSE=	other

WRKSRC=		${WRKDIR}/mnm
USE_TK=		84
USE_TK_BUILD=	84

.include <bsd.port.pre.mk>

post-extract:
	@${MKDIR} ${WRKSRC}/freebsd
	@${CP} ${FILESDIR}/Makefile.work ${WRKSRC}/Makefile
	@${CP} ${FILESDIR}/Makefile.freebsd ${WRKSRC}/src

# The included makefile doesn't have an "install" target.
do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/freebsd/imm ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/freebsd/immserv ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/freebsd/lscomp ${PREFIX}/bin
# and no man pages at all yet.
# But include the very limited documentation
	${MKDIR} ${PREFIX}/share/doc/imm
.if !defined(NOPORTDOCS)
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/imm
	${INSTALL_DATA} ${WRKSRC}/imm_readme.txt ${PREFIX}/share/doc/imm
.endif
# The sdr plugin is pretty much required.
	${INSTALL_DATA} ${WRKSRC}/sdr2.plugin.S53.image.imm ${PREFIX}/share/doc/imm

.include <bsd.port.post.mk>
