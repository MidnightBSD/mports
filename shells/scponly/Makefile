PORTNAME=	scponly
PORTVERSION=	4.8.20110526
PORTREVISION=	1
CATEGORIES=	shells security
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=	${PORTNAME}/${PORTNAME}-snapshots
DISTNAME=	${PORTNAME}-20110526
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tiny shell that only permits scp and sftp

LICENSE=	bsd2

PORTDOCS=	BUILDING-JAILS.TXT INSTALL README SECURITY

GNU_CONFIGURE=	yes

OPTIONS=	SCPONLY_WILDCARDS "wildcards processing" on \
		SCPONLY_GFTP "gftp compatibility" on \
		SCPONLY_CHROOT "chroot functionality" off \
		SCPONLY_RSYNC "rsync compatibility" off \
		SCPONLY_SCP "vanilla scp compatibility" off \
		SCPONLY_SVN "subversion compatibility" off \
		SCPONLY_SVNSERVE "subversion compatibility svn+ssh://" off \
		SCPONLY_UNISON "unison compatibility" off \
		SCPONLY_WINSCP "WinSCP compatibility" off

.include <bsd.port.pre.mk>

.if defined(SCPONLY_DEFAULT_CHDIR) && !empty(SCPONLY_DEFAULT_CHDIR)
CONFIGURE_ARGS+=--with-default-chdir=${SCPONLY_DEFAULT_CHDIR}
.endif

.if defined(WITH_SCPONLY_WILDCARDS)
CONFIGURE_ARGS+=--enable-wildcards
.else
CONFIGURE_ARGS+=--disable-wildcards
.endif

.if defined(WITH_SCPONLY_GFTP)
CONFIGURE_ARGS+=--enable-gftp-compat
.else
CONFIGURE_ARGS+=--disable-gftp-compat
.endif

.if defined(WITH_SCPONLY_CHROOT)
PLIST_SUB+=	SCPONLY_CHROOT=""
CONFIGURE_ARGS+=--enable-chrooted-binary
USE_RC_SUBR+=	scponlyc
.else
PLIST_SUB+=	SCPONLY_CHROOT="@comment "
.endif

.if defined(WITH_SCPONLY_RSYNC)
BUILD_DEPENDS+=	rsync:${PORTSDIR}/net/rsync
CONFIGURE_ARGS+=--enable-rsync-compat
.else
CONFIGURE_ARGS+=--disable-rsync-compat
.endif

.if defined(WITH_SCPONLY_SCP)
CONFIGURE_ARGS+=--enable-scp-compat
.else
CONFIGURE_ARGS+=--disable-scp-compat
.endif

.if defined(WITH_SCPONLY_SVN)
CONFIGURE_ARGS+=--enable-svn-compat
.else
CONFIGURE_ARGS+=--disable-svn-compat
.endif

.if defined(WITH_SCPONLY_SVNSERVE)
CONFIGURE_ARGS+=--enable-svnserv-compat
.else
CONFIGURE_ARGS+=--disable-svnserv-compat
.endif

.if defined(WITH_SCPONLY_UNISON)
BUILD_DEPENDS+=	unison:${PORTSDIR}/net/unison
CONFIGURE_ARGS+=--enable-unison-compat
.else
CONFIGURE_ARGS+=--disable-unison-compat
.endif

.if defined(WITH_SCPONLY_WINSCP)
CONFIGURE_ARGS+=--enable-winscp-compat
.else
CONFIGURE_ARGS+=--disable-winscp-compat
.endif

# svn, svnlook ... are per default in subversion
# only check for one of them!
.if defined(WITH_SCPONLY_SVN) || defined(WITH_SCPONLY_SVNSERVE)
BUILD_DEPENDS+=	svn:${PORTSDIR}/devel/subversion
.endif

RUN_DEPENDS:=	${BUILD_DEPENDS}

post-patch:
	@${ECHO_MSG} "In addition to knobs available from the OPTIONS dialog,"
	@${ECHO_MSG} "you may set SCPONLY_DEFAULT_CHDIR to make users 'cd' to"
	@${ECHO_MSG} "this directory after authentication."

post-install:
	@${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/$i ${DOCSDIR}
.endfor
	@${ECHO_MSG} ""
	@${ECHO_MSG} "For information on several potential security concerns,"
	@${ECHO_MSG} "please read:"
	@${ECHO_MSG} "${DOCSDIR}/SECURITY"
	@${ECHO_MSG} ""


.include <bsd.port.post.mk>
