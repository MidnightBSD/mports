# $MidnightBSD$
# $FreeBSD: ports/sysutils/dmidecode/Makefile,v 1.9 2007/03/25 12:42:25 rafan Exp $

PORTNAME=	dmidecode
PORTVERSION=	2.12
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_SAVANNAH} \
		ftp://ftp.nuug.no/pub/anders/distfiles/
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for dumping DMI (SMBIOS) contents in human-readable format

LICENSE=	gpl2

FAKE_OPTS=	trueprefix

ONLY_FOR_ARCHS=	i386 amd64

USES=		tar:bzip2
USE_GETOPT_LONG=	yes
MAKE_ENV+=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}" DOCSDIR="${DOCSDIR}"

PORTDOCS=	AUTHORS CHANGELOG README

MAN8=		biosdecode.8 dmidecode.8 ownership.8 vpddecode.8

post-patch:
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} -e '/^install.*:/s,install-doc,,' ${WRKSRC}/Makefile
.endif

post-install:
.if !defined(NOPORTDOCS)
	${INSTALL} -d -o root -g wheel -m 0755 ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/
.endfor
.endif

.include <bsd.port.mk>
