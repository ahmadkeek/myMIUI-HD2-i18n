.class final Lcom/miui/antispam/firewall/FwlogGroupListAdapter$ListViews;
.super Ljava/lang/Object;
.source "FwlogGroupListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/antispam/firewall/FwlogGroupListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ListViews"
.end annotation


# instance fields
.field public _id:J

.field public final count:Landroid/widget/TextView;

.field public final data1:Landroid/widget/TextView;

.field public final data2:Landroid/widget/TextView;

.field public final subtitle:Landroid/widget/TextView;

.field public final title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    const v0, 0x7f090007

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/antispam/firewall/FwlogGroupListAdapter$ListViews;->title:Landroid/widget/TextView;

    .line 108
    const v0, 0x7f090010

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/antispam/firewall/FwlogGroupListAdapter$ListViews;->count:Landroid/widget/TextView;

    .line 109
    const v0, 0x7f090011

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/antispam/firewall/FwlogGroupListAdapter$ListViews;->subtitle:Landroid/widget/TextView;

    .line 111
    const v0, 0x7f090012

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/antispam/firewall/FwlogGroupListAdapter$ListViews;->data1:Landroid/widget/TextView;

    .line 112
    const v0, 0x7f090013

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/antispam/firewall/FwlogGroupListAdapter$ListViews;->data2:Landroid/widget/TextView;

    .line 113
    return-void
.end method


# virtual methods
.method public setGone()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 116
    iget-object v0, p0, Lcom/miui/antispam/firewall/FwlogGroupListAdapter$ListViews;->title:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 117
    iget-object v0, p0, Lcom/miui/antispam/firewall/FwlogGroupListAdapter$ListViews;->count:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 118
    iget-object v0, p0, Lcom/miui/antispam/firewall/FwlogGroupListAdapter$ListViews;->subtitle:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 120
    iget-object v0, p0, Lcom/miui/antispam/firewall/FwlogGroupListAdapter$ListViews;->data1:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 121
    iget-object v0, p0, Lcom/miui/antispam/firewall/FwlogGroupListAdapter$ListViews;->data2:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 122
    return-void
.end method
