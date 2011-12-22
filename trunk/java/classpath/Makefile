# $MidnightBSD: mports/java/classpath/Makefile,v 1.4 2011/12/15 00:57:48 laffer1 Exp $

PORTNAME=	classpath
PORTVERSION=	0.98
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_GNU}classpath/:cp \
		${MASTER_SITE_SAVANNAH}classpath/:cp \
		http://archive.eclipse.org/eclipse/downloads/drops/R-3.2.2-200702121330/:ecj \
		http://www.antlr.org/download/:antlr
DISTFILES=	${DISTNAME}.tar.gz:cp ecj.jar:ecj antlr-3.4-complete.jar:antlr

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GNU project to create a free Java class library
LICENSE=	gpl2

BUILD_DEPENDS=	zip:${PORTSDIR}/archivers/zip \
		fastjar:${PORTSDIR}/archivers/fastjar

USE_GCC=	4.7
USE_XORG=	x11 ice xtst xaw xproto xext
WANT_GNOME=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CXXFLAGS="${CXXFLAGS} -I${LOCALBASE}/include" JAVA=${WRKDIR}/bin/gij PATH="${WRKDIR}/bin:${PATH}"
MAKE_ENV+=	${CONFIGURE_ENV}
CONFIGURE_ARGS=	--enable-jni --enable-glibj --disable-alsa --disable-dssi --disable-plugin --enable-examples --enable-tools --with-glibj=zip --with-ecj-jar=${DISTDIR}/ecj.jar --with-antlr-jar=${DISTDIR}/antlr-3.4-complete.jar
USE_GMAKE=	yes

MAN1=		gappletviewer.1 \
		gjar.1 \
		gjarsigner.1 \
		gjavah.1 \
		gcjh.1 \
		gkeytool.1 \
		gnative2ascii.1 \
		gorbd.1 \
		grmid.1 \
		grmiregistry.1 \
		gserialver.1 \
		gtnameserv.1

INFO=		cp-hacking cp-tools cp-vmintegration

#CONFLICTS=	sablevm-classpath-*

OPTIONS=	GCONF "Use GConf based preferences backend" OFF \
		GTK2 "Enable Gtk+ AWT peer" ON \
		CAIRO "Use Gtk+ Cairo based Graphics2D" OFF \
		QT4 "Enable Qt AWT peer" OFF

.include <bsd.port.pre.mk>

.if defined(WITH_GCONF)
USE_GNOME+=		gconf2
CONFIGURE_ARGS+=	--enable-default-preferences-peer=gconf
PLIST_SUB+=		GCONF=""
.else
CONFIGURE_ARGS+=	--enable-default-preferences-peer=file --disable-gconf-peer
PLIST_SUB+=		GCONF="@comment "
.endif

.if defined(WITHOUT_GTK2)
CONFIGURE_ARGS+=	--disable-gtk-peer
PLIST_SUB+=		GTK2="@comment "
.if defined(WITH_CAIRO)
IGNORE=you need to enable the Gtk+ AWT peer in order to use Cairo based Graphics2D.
.endif
.else
USE_GNOME+=		gtk20
PLIST_SUB+=		GTK2=""
.if defined(WITH_CAIRO)
CONFIGURE_ARGS+=	--enable-gtk-cairo
.endif
.endif

.if defined(WITH_QT4)
CONFIGURE_ARGS+=	--enable-qt-peer
.if defined(WITHOUT_GTK2)
CONFIGURE_ARGS+=	--enable-default-toolkit=gnu.java.awt.peer.qt.QtToolkit
.endif
CONFIGURE_ENV+=		MOC="${LOCALBASE}/bin/moc-qt4"
USE_QT_VER=		4
QT_COMPONENTS=		moc_build corelib gui
PLIST_SUB+=		QT4=""
.else
PLIST_SUB+=		QT4="@comment "
.endif

pre-configure:
	${MKDIR} ${WRKDIR}/bin
	@${LN} -sf ${LOCALBASE}/bin/${GCJ}  ${WRKDIR}/bin/gcj
	@${LN} -sf ${LOCALBASE}/bin/${GIJ}  ${WRKDIR}/bin/gij
	${CP} ${FILESDIR}/ecj ${WRKDIR}/bin/ecj
	${REINPLACE_CMD} -e 's|%%DISTDIR%%|${DISTDIR}|g' ${WRKDIR}/bin/ecj

.include <bsd.port.post.mk>
