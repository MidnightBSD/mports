# New ports collection makefile for:	fontconfig
# Date created:		06 October 2002
# Whom:			Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11-fonts/fontconfig/Makefile,v 1.4 2007/03/14 04:37:40 ctriv Exp $
# $FreeBSD: ports/x11-fonts/fontconfig/Makefile,v 1.57 2006/06/12 04:58:42 mezz Exp $
#   $MCom: ports/x11-fonts/fontconfig/Makefile,v 1.3 2005/08/26 04:03:55 marcus Exp $
#

PORTNAME=	fontconfig
PORTVERSION=	2.3.2
PORTREVISION?=	6
PORTEPOCH?=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	http://fontconfig.org/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An XML-based font configuration API for X Windows

PATCH_SITES+=   http://www.freetype.org/freetype2/patches/
PATCHFILES+=    fontconfig-2.3.2-noftinternals.patch
PATCH_DIST_STRIP+=      -p1

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2 \
		expat.6:${PORTSDIR}/textproc/expat2

USE_GMAKE=	yes
PREFIX?=	${X11BASE}
INSTALLS_SHLIB=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack gnometarget pkgconfig
CONFIGURE_ARGS=	--with-confdir=${PREFIX}/etc/fonts \
		--with-expat-includes=${LOCALBASE}/include \
		--with-expat-lib=${LOCALBASE}/lib \
		--with-default-fonts=${X11BASE}/lib/X11/fonts \
		--without-add-fonts \
		--disable-docs
CONFIGURE_ENV=	HASDOCBOOK=no
MAKE_ENV=	LC_ALL=C
PKGINSTALL=	${WRKDIR}/pkg-install
PKGDEINSTALL=	${PKGINSTALL}

MAN1=		fc-match.1
MAN5=		fonts-conf.5
PORTDOCS=	fontconfig-user.html fontconfig-user.pdf fontconfig-user.txt

.include <bsd.port.pre.mk>

.if defined(WITH_CJK)
PATCH_SITES+=	http://lwj-hinet.myweb.hinet.net/ \
		ftp://local-distfiles.freebsd.org.cn/pub/china-ports/hamigua/ \
		http://bsdchat.com/dist/firefly-cjk-patchset/
PATCHFILES+=	cjk-fontconfig-2.3.2-20051217.patch.gz
PATCH_DIST_STRIP+=	-p1
.endif

MTREE_FILE=	/etc/mtree/BSD.x11-4.dist

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/doc/|} ${DOCSDIR}
.endif
	${INSTALL_MAN} ${MAN5:S|^|${WRKSRC}/doc/|} ${PREFIX}/man/man5
	if [ ! -f ${PREFIX}/etc/fonts/fonts.conf ]; then \
		${INSTALL_DATA} ${WRKSRC}/fonts.conf ${PREFIX}/etc/fonts/fonts.conf; \
		${INSTALL_DATA} ${WRKSRC}/fonts.conf ${PREFIX}/etc/fonts/fonts.conf.default; \
	else \
		${INSTALL_DATA} ${WRKSRC}/fonts.conf ${PREFIX}/etc/fonts/fonts.conf.default; \
	fi
	@${SED} -e 's|%%PREFIX%%|${TRUE_PREFIX}| ; \
		s|%%X11BASE%%|${X11BASE}|' < ${FILESDIR}/pkg-install.in \
		> ${PKGINSTALL}

.include <bsd.port.post.mk>

.endif
