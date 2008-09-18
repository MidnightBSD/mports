# New ports collection makefile for:   mono
# Date created:        22 August 2007
# Whom:                Lucas Holt <luke@Midnightbsd.org>
#
# $MidnightBSD: mports/lang/mono/Makefile,v 1.2 2008/06/17 22:25:34 stevan Exp $
# $FreeBSD: ports/lang/mono/Makefile,v 1.66 2007/03/24 22:19:49 tmclaugh Exp $
#

PORTNAME=	mono
PORTVERSION=	1.2.3.1
CATEGORIES=	lang
MASTER_SITES=	http://www.go-mono.com/sources/mono/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	tmclaugh/mono

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An open source implementation of .NET Development Framework
# There are many different licenses used!
LICENSE=	unknown

USE_BISON=	yes
USE_GNOME=	gnomehack glib20
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
LIBTOOLFILES=	configure libgc/configure
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV=	PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"
CONFIGURE_ARGS=	--program-transform-name=\'\' \
		--with-gc=included \
		--with-tls=pthread
CONFIGURE_TARGET=	--target=${ARCH}-portbld-freebsd6.0 \
		--build=${ARCH}-portbld-freebsd6.0 \
		--host=${ARCH}-portbld-freebsd6.0
MAKE_ARGS=	EXTERNAL_MCS=false

# Set location for .wapi creation.
MONO_SHARED_DIR=${WRKDIR}

# LC_ALL is set in order to work around issues people are having when using
# other languages.  This has shown itself in build fails and possibly other
# strange crashes.
MAKE_ENV=	MONO_SHARED_DIR="${MONO_SHARED_DIR}" \
		LC_ALL=C

# Removed amd64 arch because builds are exhibiting semaphore problems on
# pointyhat runs causing failure to build.
ONLY_FOR_ARCHS= i386 amd64

MAN1=		al.1 cert2spc.1 certmgr.1 chktrust.1 cilc.1 disco.1 dtd2xsd.1 \
		gacutil.1 genxs.1 ilasm.1 jay.1 macpack.1 makecert.1 mcs.1 \
		mint.1 mkbundle.1 mono-service.1 mono-shlib-cop.1 mono.1 \
		monoburg.1 monodis.1 monop.1 monostyle.1 mozroots.1 oldmono.1 \
		permview.1 prj2make.1 secutil.1 setreg.1 signcode.1 sn.1 \
		soapsuds.1 sqlsharp.1 wsdl.1 xsd.1 mono-xmltool.1 sgen.1 \
		httpcfg.1
MAN5=		mono-config.5

.include <bsd.port.pre.mk>

pre-everything::
	@${CAT} ${PKGMESSAGE}

.if exists(${LOCALBASE}/lib/libfam.so)
USE_FAM=	yes
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%X11BASE%%|${X11BASE}|g' \
		${WRKSRC}/mono/metadata/assembly.c
	@${REINPLACE_CMD} -e 's|.so.0|.so|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|-pthread|${PTHREAD_LIBS}|g' \
		${WRKSRC}/configure ${WRKSRC}/libgc/configure
	@${REINPLACE_CMD} -e 's|%%CC%%|${CC}|g ; \
		s|%%PTHREAD_LIBS%%|${PTHREAD_LIBS}|g' \
		${WRKSRC}/mcs/tools/mkbundle/mkbundle.cs

tests: build
	@${ECHO_MSG} "===> Running mono regression tests"
	@(cd ${WRKSRC}/mono/tests && ${SETENV} ${MAKE_ENV} ${GMAKE} \
		${MAKE_FLAGS} Makefile ${MAKE_ARGS} test)

post-configure:
	${REINPLACE_CMD} -e 's|share\/man|man|g' \
		${WRKSRC}/mcs/jay/Makefile

pre-install:
	${MKDIR} ${X11BASE}/lib/mono/1.0
	${MKDIR} ${X11BASE}/lib/mono/2.0
	${MKDIR} ${X11BASE}/lib/mono/gac

.include <bsd.port.post.mk>
