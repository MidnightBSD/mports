PORTNAME=	spamd
PORTVERSION=	4.9.1
PORTREVISION=	3
CATEGORIES=	mail
MASTER_SITES=	SF/freebsdspamd/spamd

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Traps spammers with a very slow smtp-login and return 4xx error
WWW=		https://freebsdspamd.sourceforge.net/

LICENSE=	bsd2

USES=		ssl
USE_RC_SUBR?=	obspamd obspamlogd

USERS=		_spamd
GROUPS=		_spamd

PORTDOCS=	ipfw-spamd.txt spamdb.txt

PLIST_DIRSTRY=	%%ETCDIR%%
PLIST_FILES=	%%ETCDIR%%/spamd.conf.sample \
		libexec/spamlogd \
		sbin/add-spamd-to-etc-service \
		sbin/spamd-setup \
		sbin/spamdb \
		share/man/man5/spamd.conf.5.gz \
		share/man/man8/spamd-setup.8.gz \
		share/man/man8/spamd.8.gz \
		share/man/man8/spamdb.8.gz \
		share/man/man8/spamlogd.8.gz

SUB_LIST=	SPAMDUSER=${USERS} \
		SPAMDGROUP=${GROUPS}

# If you are a CPANEL user the this option is for you!
# CPANEL sends periodic a 'kill -TERM spamd' to the SpamAssassin spamd, and
# this kills also the OpenBSD spamd daemon.
# With this option spamd will be installed as obspamd, and the rc script will
# be adjusted. Man page and pid file will not be renamed!
.if !defined(CPANEL)
PLIST_FILES+=	libexec/spamd
SUB_LIST+=	SPAMDBIN=spamd
.else
PLIST_FILES+=	libexec/obspamd
SUB_LIST+=	SPAMDBIN=obspamd
.endif

SUB_FILES=	pkg-install \
		pkg-message

OPTIONS_DEFINE=	DOCS

CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}

.include <bsd.port.pre.mk>

do-install:
.if !defined(CPANEL)
	${INSTALL_PROGRAM} ${WRKSRC}/spamd/spamd ${PREFIX}/libexec
.else
	${INSTALL_PROGRAM} ${WRKSRC}/spamd/spamd ${PREFIX}/libexec/obspamd
.endif
	${INSTALL_PROGRAM} ${WRKSRC}/spamlogd/spamlogd ${PREFIX}/libexec
	${INSTALL_PROGRAM} ${WRKSRC}/spamd-setup/spamd-setup ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/spamdb/spamdb ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/etc/spamd.conf.5 ${PREFIX}/share/man/man5
	${INSTALL_MAN} ${WRKSRC}/spamd/spamd.8 ${PREFIX}/share/man/man8
	${INSTALL_MAN} ${WRKSRC}/spamd-setup/spamd-setup.8 ${PREFIX}/share/man/man8
	${INSTALL_MAN} ${WRKSRC}/spamdb/spamdb.8 ${PREFIX}/share/man/man8
	${INSTALL_MAN} ${WRKSRC}/spamlogd/spamlogd.8 ${PREFIX}/share/man/man8
	@${MKDIR} ${ETCDIR}
	${INSTALL_DATA} ${WRKSRC}/etc/spamd.conf ${ETCDIR}/spamd.conf.sample

	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/doc/|} ${DOCSDIR}/

	${INSTALL_SCRIPT} ${FILESDIR}/add-spamd-to-etc-service ${PREFIX}/sbin/

.include <bsd.port.post.mk>
