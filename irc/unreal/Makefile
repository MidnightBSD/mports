PORTNAME=	unreal
DISTVERSION=	6.1.9.1
CATEGORIES=	irc
MASTER_SITES=	https://www.unrealircd.org/downloads/
DISTNAME=	${PORTNAME}ircd-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unreal - the next generation ircd
WWW=		https://www.unrealircd.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libcares.so:dns/c-ares \
		libpcre2-8.so:devel/pcre2 \
		libargon2.so:security/libargon2 \
		libsodium.so:security/libsodium \
		libjansson.so:devel/jansson \
		libmaxminddb.so:net/libmaxminddb
RUN_DEPENDS=	${LOCALBASE}/bin/geoipupdate:net/geoipupdate

USES=		cpe gmake pkgconfig ssl
CPE_VENDOR=	unrealircd
CPE_PRODUCT=	unrealircd

EXTRACT_AFTER_ARGS=	--exclude extras/*.tar.gz

HAS_CONFIGURE=	yes
USE_RC_SUBR=	unrealircd

USERS=		ircd
GROUPS=		ircd

MODULESDIR=	${PREFIX}/lib/${PORTNAME}
MODULESSUBDIR=	chanmodes extbans rpc usermodes
CONFIGDIR=	${PREFIX}/etc/${PORTNAME}
RUNDIR=		/var/run/ircd
LOGDIR=		/var/log/ircd
CACHEDIR=	/var/cache/ircd
_TMPDIR=	/tmp

SUB_LIST+=	RUNDIR=${RUNDIR} \
		USERS=${USERS} \
		GROUPS=${GROUPS}

CONFIGURE_ARGS=	--with-nick-history=2000 \
		--with-bindir=${LOCALBASE}/libexec \
		--with-scriptdir=${DATADIR} \
		--with-confdir=${CONFIGDIR} \
		--with-builddir=${WRKSRC} \
		--with-modulesdir=${MODULESDIR} \
		--with-logdir=${LOGDIR} \
		--with-cachedir=${CACHEDIR} \
		--with-tmpdir=${_TMPDIR} \
		--with-datadir=${DATADIR}/data \
		--with-docdir=${DATADIR}/doc \
		--with-pidfile=${RUNDIR}/ircd.pid \
		--with-controlfile=${RUNDIR}/ircd.ctl \
		--with-permissions=0600 \
		--with-system-cares \
		--with-system-argon2 \
		--enable-dynamic-linking \
		--enable-libmaxminddb=yes \
		--enable-ssl

OPTIONS_DEFINE=	DOCS

PORTDOCS=	*
DOCS=		Authors coding-guidelines \
		tao.of.irc translations.txt \
		technical/005.txt technical/base64.txt \
		technical/serverprotocol.txt

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/ircd ${PREFIX}/libexec/unrealircd
	${INSTALL_PROGRAM} ${WRKSRC}/src/unrealircdctl ${PREFIX}/libexec/unrealircdctl
	${INSTALL_SCRIPT} ${WRKSRC}/unrealircd ${PREFIX}/sbin/unrealircd
	${MKDIR} ${FAKE_DESTDIR}${CACHEDIR}
	${MKDIR} ${CONFIGDIR}
	${MKDIR} ${CONFIGDIR}/aliases
	${MKDIR} ${CONFIGDIR}/examples
	${MKDIR} ${CONFIGDIR}/help
	${MKDIR} ${CONFIGDIR}/tls
	${MKDIR} ${FAKE_DESTDIR}${LOGDIR}
	${MKDIR} ${MODULESDIR}
	${MKDIR} ${MODULESDIR}/chanmodes
	${MKDIR} ${MODULESDIR}/extbans
	${MKDIR} ${MODULESDIR}/rpc
	${MKDIR} ${MODULESDIR}/usermodes
	${MKDIR} ${FAKE_DESTDIR}${RUNDIR}
	${TOUCH} ${CONFIGDIR}/ircd.motd.sample
	${TOUCH} ${CONFIGDIR}/ircd.rules.sample
	(cd ${WRKSRC}/doc/conf && ${COPYTREE_SHARE} . ${CONFIGDIR})
	${INSTALL_DATA} ${WRKSRC}/doc/conf/examples/example.conf ${CONFIGDIR}/unrealircd.conf.sample
	${INSTALL_LIB} ${WRKSRC}/src/modules/*.so ${MODULESDIR}
.for subdir in ${MODULESSUBDIR}
	${INSTALL_LIB} ${WRKSRC}/src/modules/${subdir}/*.so ${MODULESDIR}/${subdir}/
.endfor

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for file in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/doc/${file} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
