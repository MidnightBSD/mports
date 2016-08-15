# $MidnightBSD$
# $FreeBSD: head/print/texlive-tlmgr/Makefile 392808 2015-07-24 09:35:07Z hrs $

PORTNAME=	texlive
PORTVERSION=	20150523
CATEGORIES=	print perl5
MASTER_SITES=	ftp://tug.org/historic/systems/texlive/2015/
PKGNAMESUFFIX=	-tlmgr
DISTNAME=	${PORTNAME}-${PORTVERSION}-extra
DIST_SUBDIR=	TeX

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TeXLive manager modules

LICENSE=	unknown

CONFLICTS=	texlive-infra-[0-9]*

USES=		perl5 tar:xz
USE_PERL5=	run
USE_TEX=	yes
NO_BUILD=	yes

do-install:
	@${MKDIR} ${PREFIX}/${SITE_PERL_REL}/TeXLive
	${INSTALL_DATA} ${WRKSRC}/tlpkg/TeXLive/*.pm \
	    ${PREFIX}/${SITE_PERL_REL}/TeXLive
	@${MKDIR} ${PREFIX}/${TEXMFDISTDIR}
	${TOUCH} ${PREFIX}/${TEXMFDISTDIR}/.texlive-tlmgr

.include <bsd.port.mk>
